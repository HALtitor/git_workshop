//
//  ViewController.swift
//  英単語アプリ
//
//  Created by 高松　拓実 on 2018/11/09.
//  Copyright © 2018 高松　拓実. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

 
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // ボタンの装飾
        let rgba = UIColor(red: 255/255, green: 128/255, blue: 168/255, alpha: 1.0) // ボタン背景色設定
        button.backgroundColor = rgba                                               // 背景色
        button.layer.borderWidth = 0.5                                              // 枠線の幅
        button.layer.borderColor = UIColor.black.cgColor                            // 枠線の色
        button.layer.cornerRadius = 5.0                                             // 角丸のサイズ
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)             // タイトルの色
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

