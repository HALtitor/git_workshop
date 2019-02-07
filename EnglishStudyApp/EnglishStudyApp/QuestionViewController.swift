//
//  QuestionViewController.swift
//  EnglishStudyApp
//
//  Created by uehara kazuma on 2018/11/29.
//  Copyright © 2018 uehara kazuma. All rights reserved.
//

import UIKit

import AVFoundation

class QuestionViewController: UIViewController {
    
    // UserDefaults のインスタンス
    let userDefaults = UserDefaults.standard
    
    @IBOutlet weak var qtext: UILabel! //問題文
    @IBOutlet weak var c1: UIButton! //選択肢1~4
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    @IBOutlet weak var c4: UIButton!
    @IBOutlet weak var ans: UILabel! //正解かどうかを表示
    @IBOutlet weak var nextQ: UIButton! //次の問題へ行く
    
    @IBOutlet weak var goScore: UIButton! //スコア画面へ遷移
    @IBOutlet weak var goTitle: UIButton! //タイトル画面へ遷移
    @IBOutlet weak var QuestionIndex: UILabel! //何問目か
    
    @IBOutlet weak var kaisetu: UILabel! //解説文
    @IBOutlet weak var readButton: UIButton! //問題文読み上げ
    
    @IBOutlet weak var correctRate: UILabel!
    
    var timer:Timer = Timer()//制限時間のタイマー
    
    var correctAnswer = 0 //答えが選択肢の何番めか
    var userChoiceAnswer = 0 //ユーザーの回答した選択肢
    var isCorrect = false //正解か不正解か
    var answerName = "" //答え
    var QuestionNo = 0 //
    
    let prg:UIProgressView = UIProgressView()//制限時間バーに使う
    var timer2:Timer = Timer()
    var progress:Float = 0.0
    
    func progressBar() {
        //作って画面に表示
        prg.frame = CGRect(x: 25, y: 100, width: 720, height: 30)
        prg.transform = CGAffineTransform(scaleX: 1.0, y: 5.0) //横１倍、縦５倍に引き伸ばし
        prg.setProgress(1, animated: true)
        prg.progressTintColor = UIColor.blue
        view.addSubview(prg)
        
        //バーがだんだん短くなっていくようにTimerでリピートさせる
        self.timer2 = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(QuestionViewController.timerFunc), userInfo: nil, repeats: true)
    }
    
    @objc func restart() {
        timer2.invalidate()
        prg.progressTintColor = UIColor.blue
        progress = 1
        self.timer2 = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(QuestionViewController.timerFunc), userInfo: nil, repeats: true)
        prg.setProgress(progress, animated: false)
    }
    
    //タイマーの中身
    @objc func timerFunc() {
        // prgの現在の数値より少しだけ少ない数値をprgにセット
        let newValue = prg.progress - 0.001
        
        if(newValue < 0.6 && newValue >= 0.3){
            prg.progressTintColor = UIColor.yellow
            prg.setProgress(newValue, animated: true)
        }else if(newValue < 0.3) {
            prg.progressTintColor = UIColor.red
            prg.setProgress(newValue, animated: true)
        }else if (newValue < 0) {
            
            prg.setProgress(0, animated: true)
            
            timer2.invalidate()
        } else {
            prg.setProgress(newValue, animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        // 問題文の読込
        
        
        QuestionDataManager.sharedInstance.loadQuestion()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.correctCount = 0
        appDelegate.Qindex = 1
        
        initQ() //ラベル等の初期化
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func c1Action(_ sender: Any) {
        userChoiceAnswer = 1
        judge() //正誤判定
        display() //ボタン等の表示の変更
    }
    @IBAction func c2Action(_ sender: Any) {
        userChoiceAnswer = 2
        judge()
        display()
    }
    @IBAction func c3Action(_ sender: Any) {
        userChoiceAnswer = 3
        judge()
        display()
    }
    @IBAction func c4Action(_ sender: Any) {
        userChoiceAnswer = 4
        judge()
        display()
    }
    
    @IBAction func nextQ(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if(appDelegate.Qindex == 99){
            appDelegate.Qindex += 1
            nextQ.isEnabled = false
        }else{
            appDelegate.Qindex += 1
        }
        initQ()
    }
    
    @IBAction func goScore(_ sender: Any) {
        
    }
    
    
    func initQ(){ //初期化
        // 問題文の取り出し
        guard let questionData = QuestionDataManager.sharedInstance.nextQuestion() else{
            // 取得できずに終了
            return
        }
        // 問題文のセット
        qtext.text = questionData.question
        c1.setTitle(questionData.answer1, for: .normal)
        c2.setTitle(questionData.answer2, for: .normal)
        c3.setTitle(questionData.answer3, for: .normal)
        c4.setTitle(questionData.answer4, for: .normal)
        correctAnswer = questionData.correctAnswerNumber
        kaisetu.text = questionData.kaisetu
        
        
        QuestionNo = questionData.questionNo
        // デフォルト値
        userDefaults.register(defaults: [QuestionNo.description+"Qcount": 0])
        userDefaults.register(defaults: [QuestionNo.description+"Qhitcount": 0])
        
        
        //ラベルの表示、trueなら非表示
        ans.isHidden = true
        nextQ.isHidden = true
        kaisetu.isHidden = true
        c1.isHidden = false
        c2.isHidden = false
        c3.isHidden = false
        c4.isHidden = false
        isCorrect = false
        
        //ボタンの有効化、trueなら有効,falseなら無効
        c1.isEnabled = true
        c2.isEnabled = true
        c3.isEnabled = true
        c4.isEnabled = true
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        QuestionIndex.text = "第"+appDelegate.Qindex.description+"問"
        
        switch correctAnswer { //答えを代入
        case 1:
            answerName = questionData.answer1
        case 2:
            answerName = questionData.answer2
        case 3:
            answerName = questionData.answer3
        case 4:
            answerName = questionData.answer4
        default:
            break
        }
        
        userChoiceAnswer = 0
        
        if(appDelegate.Qindex == 1){
            progressBar()
        }else{
            restart()
        }
        
        let qcount: Int = userDefaults.object(forKey: QuestionNo.description+"Qcount") as! Int
        let hitcount: Int = userDefaults.object(forKey: QuestionNo.description+"Qhitcount") as! Int
        
        correctRate.text = "正答率："+((hitcount*100)/qcount).description+"%"
        
        // インクリメント
        let qcountinc: Int = userDefaults.object(forKey: QuestionNo.description+"Qcount") as! Int
        userDefaults.set(qcountinc+1, forKey: QuestionNo.description+"Qcount")
        userDefaults.synchronize()
        
        self.timer = Timer.scheduledTimer(timeInterval:10.1,target: self,selector: #selector(QuestionViewController.judge),userInfo: nil,repeats: false) //タイマー開始
        
    }
    
    func display(){ //正解かどうかと次の問題ボタンの表示
        ans.isHidden = false
        nextQ.isHidden = false
        
        c1.isEnabled = false
        c2.isEnabled = false
        c3.isEnabled = false
        c4.isEnabled = false
    }
    
    @objc func judge(){ //正誤判定
        self.timer.invalidate() //タイマーリセット
        self.timer2.invalidate()
        let qcount: Int = userDefaults.object(forKey: QuestionNo.description+"Qcount") as! Int
        let hitcount: Int = userDefaults.object(forKey: QuestionNo.description+"Qhitcount") as! Int
        
        if(userChoiceAnswer == correctAnswer){
            
            // インクリメント
            let hitcountinc: Int = userDefaults.object(forKey: QuestionNo.description+"Qhitcount") as! Int
            userDefaults.set(hitcountinc+1, forKey: QuestionNo.description+"Qhitcount")
            userDefaults.synchronize()
            
            let hitcount: Int = userDefaults.object(forKey: QuestionNo.description+"Qhitcount") as! Int
            ans.text = "正解！！！正答率は"+((hitcount*100)/qcount).description+"%でした。"
            
            isCorrect = true
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.correctCount += 1
        }else if(userChoiceAnswer == 0){
            ans.text = "時間切れ！正解は「"+answerName+"」でした。正答率は"+((hitcount*100)/qcount).description+"%でした。"
            display()
        }else{
            ans.text = "不正解。。。正解は「"+answerName+"」でした。正答率は"+((hitcount*100)/qcount).description+"%でした。"
        }
        kaisetu.isHidden = false
    }

    @IBAction func read(_ sender: Any) {
        let talker = AVSpeechSynthesizer()
        let text = qtext.text
        let readWord = text!.components(separatedBy: "  ")
        let utterance = AVSpeechUtterance(string: readWord[0])
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        talker.speak(utterance)
    }
}
