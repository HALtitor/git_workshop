//
//  ScoreViewController.swift
//  EnglishStudyApp
//
//  Created by uehara kazuma on 2018/11/29.
//  Copyright © 2018 uehara kazuma. All rights reserved.
//

import UIKit
import AVFoundation

class ScoreViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var scoreparcent: UILabel!
    
    var talker = AVSpeechSynthesizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let Qnum = appDelegate.Qindex
        let correctnum = appDelegate.correctCount
        scoreLabel.text = appDelegate.Qindex.description + "問中" +  appDelegate.correctCount.description + "問正解！"
        
        scoreparcent.text = String( correctnum * 100 / Qnum) + "%"
        
        /* --- 四角形を描画 --- */
        let rectangleLayer = CAShapeLayer.init()
        let rectangleFrame = CGRect.init(x: 30, y: 310, width: 700, height: 100)
        rectangleLayer.frame = rectangleFrame
        
        // 輪郭の色
        rectangleLayer.strokeColor = UIColor.blue.cgColor
        // 四角形の中の色
        rectangleLayer.fillColor = UIColor.blue.cgColor
        // 輪郭の太さ
        rectangleLayer.lineWidth = 2.5
        
        // 四角形を描画
        rectangleLayer.path = UIBezierPath.init(rect: CGRect.init(x: 0, y: 0, width: rectangleFrame.size.width, height: rectangleFrame.size.height)).cgPath
        
        self.view.layer.addSublayer(rectangleLayer)
        // Do any additional setup after loading the view.
        
        
        /* --- 四角形を描画 --- */
        let rectangleLayer2 = CAShapeLayer.init()
        let rectangleFrame2 = CGRect.init(x: 30, y: 310, width: 7*correctnum*100 / Qnum, height: 100)
        rectangleLayer2.frame = rectangleFrame2
        
        // 輪郭の色
        rectangleLayer2.strokeColor = UIColor.red.cgColor
        // 四角形の中の色
        rectangleLayer2.fillColor = UIColor.red.cgColor
        // 輪郭の太さ
        rectangleLayer2.lineWidth = 2.5
        
        // 四角形を描画
        rectangleLayer2.path = UIBezierPath.init(rect: CGRect.init(x: 0, y: 0, width: rectangleFrame2.size.width, height: rectangleFrame2.size.height)).cgPath
        
        self.view.layer.addSublayer(rectangleLayer2)

        
        
        // 話す内容をセット
       // let utterance = AVSpeechUtterance(string:"test")
        // 言語を日本に設定
      //  utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
        // 実行
       // self.talker.speak(utterance)


}
}
