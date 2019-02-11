//
//  MenuViewController.swift
//  EnglishStudyApp
//
//  Created by uehara kazuma on 2018/11/29.
//  Copyright © 2018 uehara kazuma. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    //  userDefaultsの定義
    var userDefaults = UserDefaults.standard
    
    var setDATE: [String] = []
    let dateFormater = DateFormatter()
    
    
    @IBAction func GoQue(_ sender: UIButton, forEvent event: UIEvent) {
        dateFormater.locale = Locale(identifier: "ja_JP")
        dateFormater.dateFormat = "yyyy/MM/dd HH:mm:ss"
        let date = dateFormater.string(from: Date())
        setDATE.append(date)
        
        userDefaults.set(setDATE, forKey:"SETDATE")
        userDefaults.synchronize()
    }
    
    
    @IBAction func GoUser(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
   //  let getDATE:[String] = userDefaults.object(forKey: "SETDATE") as! Array<String>
   
    
}

