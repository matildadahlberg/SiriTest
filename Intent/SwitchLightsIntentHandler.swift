//
//  SwitchLightsIntentHandler.swift
//  Intent
//
//  Created by Matilda Dahlberg on 2019-03-18.
//  Copyright © 2019 Matilda Dahlberg. All rights reserved.
//

import Foundation
import UIKit


class SwitchLightsIntentHandler: NSObject, SwitchLightsIntentHandling{
    
    func confirm(intent: SwitchLightsIntent, completion: @escaping (SwitchLightsIntentResponse) -> Void) {
        print("we're confirming stuff")

        completion(SwitchLightsIntentResponse(code: .ready, userActivity: nil))
    }
    
    
    func handle(intent: SwitchLightsIntent, completion: @escaping (SwitchLightsIntentResponse) -> Void) {
        print("we handling an intent: \n\(intent)")

        let sharedDevices: [Device] = Shared.cache.devices.map { (immutableLight: Device) in
            
            var light = immutableLight // make a mutable copy of the input thing

            if intent.on == "on" {
                // stuff should turn on
                light.isOn = true
            } else {
                // stuff should turn off
                light.isOn = false
            }

            return light
        }
        
        Shared.cache.devices = sharedDevices
        
        completion(SwitchLightsIntentResponse(code: .success, userActivity: nil))
  }
    
    
}


