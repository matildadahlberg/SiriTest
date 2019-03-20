//
//  ViewController.swift
//  Siri
//
//  Created by Matilda Dahlberg on 2019-03-18.
//  Copyright © 2019 Matilda Dahlberg. All rights reserved.
//

import UIKit
import os
import Intents


class ViewController: UIViewController {
    
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var switchOutlet: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switchOutlet.isOn = false
        
    }
    
    
    
    @IBAction func switchAction(_ sender: Any) {
        donateInteraction()
        
        let AppGroup = "group.com.daresay.Siri.Shared"
        
        
        
        
        guard let defaults = UserDefaults(suiteName: AppGroup) else {return}
        
        defaults.synchronize()
        
        print("hey")
    }
 
    
    private func donateInteraction() {
        let intent = SwitchLightsIntent()
        let interaction = INInteraction(intent: intent, response: nil)
        
       
        
        interaction.donate { (error) in
            if error != nil {
                if let error = error as NSError? {
                    os_log("Interaction donation failed: %@", log: OSLog.default, type: .error, error)
                }
            } else {
                os_log("Successfully donated interaction")
            }
        }
    }
    
   
    
    
}

