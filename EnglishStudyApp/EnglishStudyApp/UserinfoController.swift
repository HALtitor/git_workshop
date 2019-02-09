//
//  UserinfoController.swift
//  EnglishStudyApp
//
//  Created by takaaki miyagi  on 2019/02/09.
//  Copyright © 2019 uehara kazuma. All rights reserved.
//

import UIKit

class UserinfoController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    let TODO = ["牛乳を買う", "掃除をする", "アプリ開発の勉強をする"]
    // 遷移先のViewControllerに渡す変数
    var giveData: String = ""

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TODO.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
         Cell.name.text = TODO[indexPath.item]
        return Cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
  
    // cellが押されたときに呼ばれる関数
    // 画面遷移の処理もここで書いている
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 押されたときのcellのlabelの文字列をViewControllerに渡したいので、一旦、giveDataに入れとく
       giveData = TODO[indexPath.item]
        // Segueを使った画面遷移を行う関数
        performSegue(withIdentifier: "Segue", sender: nil)
    }

    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "Segue" {
            let vc = segue.destination as! DisplayViewController
            vc.receiveData = giveData
        }
    }
}
