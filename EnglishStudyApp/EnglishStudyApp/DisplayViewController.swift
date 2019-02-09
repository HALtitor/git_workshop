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
    var receiveData: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

      Label.text = receiveData
    }
    

    
}
