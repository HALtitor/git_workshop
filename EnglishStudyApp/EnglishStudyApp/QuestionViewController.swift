//
//  QuestionViewController.swift
//  EnglishStudyApp
//
//  Created by uehara kazuma on 2018/11/29.
//  Copyright © 2018 uehara kazuma. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var qtext: UILabel!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    @IBOutlet weak var c4: UIButton!
    @IBOutlet weak var ans: UILabel!
    @IBOutlet weak var nextQ: UIButton!
    
    @IBOutlet weak var goScore: UIButton!
    @IBOutlet weak var goTitle: UIButton!
    
    var correctAnswer = 0
    var userChoiceAnswer = 0
    var isCorrect = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 問題文の読込
        QuestionDataManager.sharedInstance.loadQuestion()
        
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
        
        Hide()
        
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
        if(correctAnswer == 1){
            ans.text = "正解！！！"
        }else{
            ans.text = "不正解。。。"
        }
        unHide(isCorrect: isCorrect)
    }
    @IBAction func c2Action(_ sender: Any) {
        if(correctAnswer == 2){
            ans.text = "正解！！！"
        }else{
            ans.text = "不正解。。。"
        }
        unHide(isCorrect: isCorrect)
    }
    @IBAction func c3Action(_ sender: Any) {
        if(correctAnswer == 3){
            ans.text = "正解！！！"
        }else{
            ans.text = "不正解。。。"
        }
        unHide(isCorrect: isCorrect)
    }
    @IBAction func c4Action(_ sender: Any) {
        if(correctAnswer == 4){
            ans.text = "正解！！！"
        }else{
            ans.text = "不正解。。。"
        }
        unHide(isCorrect: isCorrect)
    }
    
    @IBAction func nextQ(_ sender: Any) {
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
        
        Hide()
    }
    
    func Hide(){
        ans.isHidden = true
        nextQ.isHidden = true
        
    }
    
    func unHide(isCorrect: Bool){
        ans.isHidden = false
        nextQ.isHidden = false
        
        if(isCorrect){
            if(correctAnswer == 1){
                c2.isHidden = true
                c3.isHidden = true
                c4.isHidden = true
            }else if(correctAnswer == 2){
                c1.isHidden = true
                c3.isHidden = true
                c4.isHidden = true
            }else if(correctAnswer == 3){
                c1.isHidden = true
                c2.isHidden = true
                c4.isHidden = true
            }else if(correctAnswer == 4){
                c1.isHidden = true
                c2.isHidden = true
                c3.isHidden = true
            }else{
                
            }
        }
    }

}
