//
//  UserinfoController.swift
//  EnglishStudyApp
//
//  Created by takaaki miyagi  on 2019/02/09.
//  Copyright © 2019 uehara kazuma. All rights reserved.
//

import UIKit

class UserinfoController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    //  userDefaultsの定義
    var userDefaults = UserDefaults.standard
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var getDate: [String] = []
    var getInfo_seikaisu: [String] = []
    var getInfo_percentage: [String] = []
    
    // 遷移先のViewControllerに渡す変数
    var giveData: String = ""
    var givedata: String=""
    
    var seiseki: String=""
    var percentage: String=""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // userDefaultsに保存された値の取得
        let userDATE:[String] = userDefaults.object(forKey: "SETDATE") as! [String]
        getDate = userDATE
        
        let Qnum = appDelegate.Qindex
        let correctnum = appDelegate.correctCount
        seiseki = appDelegate.Qindex.description + "問中" +  appDelegate.correctCount.description + "問正解！"
        percentage = String( correctnum * 100 / Qnum) + "%"
        
        getInfo_seikaisu.append(seiseki)
        getInfo_percentage.append(percentage)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getDate.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        Cell.name.text = getDate[indexPath.item]
        return Cell
    }
    
    // cellが押されたときに呼ばれる関数
    // 画面遷移の処理もここで書いている
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 押されたときのcellのlabelの文字列をViewControllerに渡したいので、一旦、giveDataに入れとく
        
        giveData = getInfo_seikaisu[indexPath.item]
        givedata = getInfo_percentage[indexPath.item]
        
        // Segueを使った画面遷移を行う関数
        performSegue(withIdentifier: "Segue", sender: nil)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "Segue" {
            let vc = segue.destination as! DisplayViewController
            vc.receiveData = giveData
            vc.receivedata = givedata
        }
    }
    
}
