//
//  ViewController.swift
//  EnglishStudyApp
//
//  Created by uehara kazuma on 2018/11/29.
//  Copyright © 2018 uehara kazuma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    let prg:UIProgressView = UIProgressView()
//    var timer:Timer = Timer()
//    func progress() {
//        //作って画面に表示
//        prg.frame = CGRect(x: 50, y: 100, width: 600, height: 30)
//        prg.transform = CGAffineTransform(scaleX: 1.0, y: 3.0) //横１倍、縦３倍
//        prg.setProgress(1, animated: true)
//        view.addSubview(prg)
//
//        //バーがだんだん短くなっていくようにTimerでリピートさせる
//        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.timerFunc), userInfo: nil, repeats: true)
//    }
//    //タイマーの中身
//    @objc func timerFunc() {
//        // prgの現在の数値より少しだけ少ない数値をprgにセット
//        let newValue = prg.progress - 0.01
//        // 10秒ぐらいで0になりますので
//        if (newValue < 0) {
//            // newValueが０より小さくなってしまったら
//            prg.setProgress(0, animated: true)
//            // タイマーを停止させます
//            timer.invalidate()
//        } else {
//            prg.setProgress(newValue, animated: true)
//        }
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //progress()
    }

}

