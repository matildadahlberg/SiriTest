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
    let AppGroup = "group.com.daresay.Siri.Shared"

    @IBOutlet weak var switchOutlet: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        switchOutlet.isOn = false
        
        switchOutlet.isOn = UserDefaults.standard.bool(forKey: "SwitchStatus");

    }
    
    
    
    @IBAction func switchAction(_ sender: Any) {
        donateInteraction()
        
    
        guard let defaults = UserDefaults(suiteName: AppGroup) else {return}
        
        UserDefaults.standard.set(switchOutlet.isOn, forKey: "SwitchStatus")
        
        defaults.synchronize()
        
        print("hey")
    }
 

    
    func donateInteraction() {
        let intent = SwitchLightsIntent()
        intent.suggestedInvocationPhrase = "light"
        intent.lights = "lights"
        intent.on = "on"
        intent.off = "off"
        
//        if (intent.on == nil) {
//            switchOutlet.isOn = true
//        }
        
        
        let interaction = INInteraction(intent: intent, response: nil)
        interaction.groupIdentifier = AppGroup
        interaction.donate { (error) in
            if error != nil {
                if let error = error as NSError? {
                    print("Interaction donation failed: %@", error)
                } else {
                    print("Successfully donated interaction")
                }
            }
        }
    }
    
    
    
    
   
    
    
}

