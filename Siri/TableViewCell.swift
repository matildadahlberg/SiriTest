//
//  TableViewCell.swift
//  Siri
//
//  Created by Matilda Dahlberg on 2019-03-26.
//  Copyright © 2019 Matilda Dahlberg. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var switchOutlet: UISwitch!
    
    @IBOutlet weak var label: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
