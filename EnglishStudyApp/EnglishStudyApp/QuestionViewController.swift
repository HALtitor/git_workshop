//
//  QuestionViewController.swift
//  EnglishStudyApp
//
//  Created by uehara kazuma on 2018/11/29.
//  Copyright © 2018 uehara kazuma. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var qtext: UILabel! //問題文
    @IBOutlet weak var c1: UIButton! //選択肢1~4
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    @IBOutlet weak var c4: UIButton!
    @IBOutlet weak var ans: UILabel! //正解かどうかを表示
    @IBOutlet weak var nextQ: UIButton! //次の問題へ行く
    
    @IBOutlet weak var goScore: UIButton! //スコア画面へ遷移
    @IBOutlet weak var goTitle: UIButton! //タイトル画面へ遷移
    
    var correctAnswer = 0 //答えが選択肢の何番めか
    var userChoiceAnswer = 0 //ユーザーの回答した選択肢
    var isCorrect = false //正解か不正解か
    var answerName = "" //答え
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 問題文の読込
        QuestionDataManager.sharedInstance.loadQuestion()
        
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
        initQ()
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
        
        ans.isHidden = true //ラベル等の表示、有効化など
        nextQ.isHidden = true
        c1.isHidden = false
        c2.isHidden = false
        c3.isHidden = false
        c4.isHidden = false
        isCorrect = false
        c1.isEnabled = true //trueなら有効,falseなら無効
        c2.isEnabled = true
        c3.isEnabled = true
        c4.isEnabled = true
        
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
    }
    
    func display(){ //表示と有効化
        ans.isHidden = false
        nextQ.isHidden = false
        
        c1.isEnabled = false
        c2.isEnabled = false
        c3.isEnabled = false
        c4.isEnabled = false
        if(isCorrect){
            switch correctAnswer {
            case 1:
                c1.isEnabled = true
            case 2:
                c2.isEnabled = true
            case 3:
                c3.isEnabled = true
            case 4:
                c4.isEnabled = true
            default:
                break
            }
        }
    }
    
    func judge(){ //正誤判定
        if(userChoiceAnswer == correctAnswer){
            ans.text = "正解！！！"
            isCorrect = true
        }else{
            ans.text = "不正解。。。正解は「"+answerName+"」でした。"
        }
    }
}
