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
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        buttonOutlet.layer.cornerRadius = 15
        
        donateInteraction()
        
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        toggleFlash()
        donateInteraction()
        
    }
    
    func toggleFlash() {
        guard let device = AVCaptureDevice.default(for: AVMediaType.video) else { return }
        guard device.hasTorch else { return }
        
        do {
            try device.lockForConfiguration()
            
            
            do {
                device.torchMode = AVCaptureDevice.TorchMode.on
                try device.setTorchModeOn(level: 1.0)
            } catch {
                print(error)
            }
            
        } catch {
            print(error)
        }
        
    }
    
    
    func donateInteraction() {
        let intent = SwitchLightsIntent()
        
        intent.suggestedInvocationPhrase = "Sätt på lampaaaa"
        
        let interaction = INInteraction(intent: intent, response: nil)
        
        interaction.donate { (error) in
            if error != nil {
                if let error = error as NSError? {
                    os_log("Interaction donation failed: %@", log: OSLog.default, type: .error, error)
                } else {
                    os_log("Successfully donated interaction")
                }
            }
        }
    }
    
    
}

