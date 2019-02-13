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
    
    
    @IBAction func GoqQuestion(_ sender: Any) {
        dateFormater.locale = Locale(identifier: "ja_JP")
        dateFormater.dateFormat = "yyyy/MM/dd HH:mm:ss"
        let date = dateFormater.string(from: Date())
        setDATE.append(date)
        userDefaults.set(setDATE, forKey:"SETDATE")
        userDefaults.synchronize()
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBOutlet weak var `default`: UIButton!
    
    @IBOutlet weak var custom: UIButton!

    
   
    

    
    @IBAction func defaultQ(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.questionGenre = "100question"
    }
    
    @IBAction func customQ(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.questionGenre = "MakeQuestion"
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

