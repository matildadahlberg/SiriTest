//
//  SwitchLightsIntentHandler.swift
//  Intent
//
//  Created by Matilda Dahlberg on 2019-03-18.
//  Copyright © 2019 Matilda Dahlberg. All rights reserved.
//

import Foundation
import  UIKit


class SwitchLightsIntentHandler: NSObject, SwitchLightsIntentHandling{
    
    
    
    func confirm(intent: SwitchLightsIntent,
                 completion: @escaping (SwitchLightsIntentResponse) -> Void) {

        completion(SwitchLightsIntentResponse(code: .ready, userActivity: nil))

    }
    
    func handle(intent: SwitchLightsIntent,
                completion: @escaping (SwitchLightsIntentResponse) -> Void) {
        
        guard intent.lights != nil else {
            
            completion(SwitchLightsIntentResponse(code: .ready, userActivity: nil))
            return
        }
        let vc = ViewController()
        vc.colorLabel.textColor = .red
        completion(SwitchLightsIntentResponse.success(lights: "kökslampan", on: "På"))

 
    }
}
