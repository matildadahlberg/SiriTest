//
//  CustomCell.swift
//  Siri
//
//  Created by Matilda Dahlberg on 2019-03-26.
//  Copyright © 2019 Matilda Dahlberg. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var switchOutlet: UISwitch!
    
    @IBOutlet weak var table: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        switchOutlet.isOn = Shared.cache.devices
        
//        Device(name: "", isOn: switchOutlet.isOn)

        
        
    }
    
    @IBAction func switchAction(_ sender: Any) {
        
//        Shared.cache.devices = switchOutlet.isOn
//        Device(name: "", isOn: switchOutlet.isOn)
        



        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
