//
//  MenuViewController.swift
//  EnglishStudyApp
//
//  Created by uehara kazuma on 2018/11/29.
//  Copyright © 2018 uehara kazuma. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    
    //let f = DateFormatter()
    var DATE: [String] = []
    let dateFormater = DateFormatter()
    
    
    @IBAction func GoQue(_ sender: UIButton, forEvent event: UIEvent) {
        dateFormater.locale = Locale(identifier: "ja_JP")
        dateFormater.dateFormat = "yyyy/MM/dd HH:mm:ss"
        let date = dateFormater.string(from: Date())
        DATE.append(date)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
}
