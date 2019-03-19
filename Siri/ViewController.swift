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
    @IBOutlet weak var colorLabel: UILabel!
    
    @IBOutlet weak var buttonOutlet: UIButton!
    
    
//    let textKey = "text"
//    let suiteName = "com.daresay.Siri"
//
//    func changeColor(text: String){
//        guard let defaults = UserDefaults(suiteName: suiteName) else{return}
//        defaults.synchronize()
//
//        let text = defaults.string(forKey: textKey)
//
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buttonOutlet.layer.cornerRadius = 15
        
//        userActivitys()
        
        donatePublishIntent()


        
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        colorLabel.textColor = .blue
        
        donatePublishIntent()

        
//        let text = changeColor(text: "Another Text")
//        colorLabel.text = "Your label: \(text)"
  
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
    
    public func donatePublishIntent() {
        
        let intent = SwitchLightsIntent()
        
        intent.suggestedInvocationPhrase = "Lights"

//        intent.on = INObject(identifier: self.title, display: self.title!)
//        intent.off = INObject(identifier: self.title, display: self.title!)
        intent.lights = "Kökslampa"
        
        let interaction = INInteraction(intent: intent, response: nil)
        
        interaction.donate(completion: nil)


        
    }
    
    
    
//    func userActivitys(){
//
//        //Create new activity with this unique id
//        let activity = NSUserActivity(activityType: "com.daresay.Siri.Light")
//
//
//        //set the activity title
//        activity.title = "Turn on light"
//        //enabling it for search result in widget menu
//        activity.isEligibleForSearch = true
//        //enabling it for so that you dont need to write the whole name in widget menu
//        activity.isEligibleForPrediction = true
//
//        //also add a userInfo dictionary with some payload that will be passed to our app when Siri launches it via shortcut.
//        activity.userInfo = ["light" : "on"]
//
//        //set the current user activity
//        self.userActivity = activity
//        //this is to show that the acitvity is actually being used
//        self.userActivity?.becomeCurrent()
//    }
    
    
}

