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

    @IBOutlet weak var switchOutlet: UISwitch!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
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
        let desiredSize = CGSize(width: width, height: 100)

                        DispatchQueue.main.async {
                            
                          
  
                            
//                            Shared.cache.lightState = self.switchOutlet.isOn
//                            if Shared.cache.lightState == true{
//                                self.switchOutlet.isOn = false
//                                Shared.cache.lightState = false
//                            }
//                            if Shared.cache.lightState == false{
//                                self.switchOutlet.isOn = true
//                                Shared.cache.lightState = true
//                            }
                        }
        completion(true, parameters, desiredSize)
    }
}
