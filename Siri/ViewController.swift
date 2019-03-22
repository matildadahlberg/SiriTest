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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        switchOutlet.isOn = Shared.cache.lightState
    }
    
    @IBAction func switchAction(_ sender: Any) {
        donateInteraction()
        
        Shared.cache.lightState = switchOutlet.isOn
    }
    
    func donateInteraction() {
        let intent = SwitchLightsIntent()
        intent.suggestedInvocationPhrase = "light"
        intent.lights = "lights"
        intent.on = "on"
        intent.off = "off"
        
        let interaction = INInteraction(intent: intent, response: nil)
        interaction.groupIdentifier = Constants.AppGroup
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

