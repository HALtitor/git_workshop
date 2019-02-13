//
//  TableViewCell.swift
//  EnglishStudyApp
//
//  Created by takaaki miyagi  on 2019/02/09.
//  Copyright © 2019 uehara kazuma. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
