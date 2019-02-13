//
//  DisplayViewController.swift
//  EnglishStudyApp
//
//  Created by takaaki miyagi  on 2019/02/09.
//  Copyright © 2019 uehara kazuma. All rights reserved.
//

import UIKit

class DisplayViewController: UIViewController {

    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var percentage: UILabel!
    
    var receiveData: String = ""
    var receivedata: String=""
    override func viewDidLoad() {
        super.viewDidLoad()

      Label.text = receiveData
      percentage.text = receivedata
    }
    

    
}
