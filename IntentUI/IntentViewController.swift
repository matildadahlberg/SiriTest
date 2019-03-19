//
//  IntentViewController.swift
//  IntentUI
//
//  Created by Matilda Dahlberg on 2019-03-18.
//  Copyright © 2019 Matilda Dahlberg. All rights reserved.
//

import IntentsUI
import AVFoundation
import os

// As an example, this extension's Info.plist has been configured to handle interactions for INSendMessageIntent.
// You will want to replace this or add other intents as appropriate.
// The intents whose interactions you wish to handle must be declared in the extension's Info.plist.

// You can test this example integration by saying things to Siri like:
// "Send a message using <myApp>"

class IntentViewController: UIViewController, INUIHostedViewControlling {
    
    @IBOutlet weak var buttonOutlet: UIButton!
    
    @IBOutlet weak var labelcolor: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        toggleFlash()
        buttonOutlet.layer.cornerRadius = 15
//        userActivitys()
    }
        
    // MARK: - INUIHostedViewControlling
    
    // Prepare your view controller for the interaction to handle.
    func configureView(for parameters: Set<INParameter>,
                       of interaction: INInteraction,
                       interactiveBehavior: INUIInteractiveBehavior,
                       context: INUIHostedViewContext,
                       completion: @escaping (Bool, Set<INParameter>, CGSize) -> Void) {
        
        guard interaction.intent is SwitchLightsIntent else {
            completion(false, Set(), .zero)
            return
        }
        
        let width = self.extensionContext?.hostedViewMaximumAllowedSize.width ?? 320
        let desiredSize = CGSize(width: width, height: 300)

        let vc = ViewController()
        let color = vc.colorLabel.textColor
        
                        DispatchQueue.main.async {
                            
                            self.labelcolor.textColor = color
                            
                        }
        
          
        
        completion(true, parameters, desiredSize)
    }
        
//
//                        DispatchQueue.main.async {
//                           self.buttonOutlet.backgroundColor = .red
//                        }
//        completion(true, parameters, desiredSize)

    
        
    

    
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
