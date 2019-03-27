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
        
        completion(SwitchLightsIntentResponse(code: .ready, userActivity: nil))
        
        print("completion ready")
        
    }
    
    
    func handle(intent: SwitchLightsIntent, completion: @escaping (SwitchLightsIntentResponse) -> Void) {
        
        print("handle success")
        
                let sharedDevices = Shared.cache.devices
        
                for light in sharedDevices {
                    if light.isOn == true {
                        completion(SwitchLightsIntentResponse.successOff(lights: "lights", off: "off"))
        
                        light.isOn = false
                    }
                    else {
        
                        completion(SwitchLightsIntentResponse.success(lights: "lights", on: "on"))
        
                        light.isOn = true
                    }
                    

                   
                }
                Shared.cache.devices = sharedDevices
                completion(SwitchLightsIntentResponse(code: .failure, userActivity: nil))


        
      
        
        //            completion(SwitchLightsIntentResponse.successOff(lights: "lights", off: "off"))
        
        //            completion(SwitchLightsIntentResponse(code: .failure, userActivity: nil))
        
        
    }
    
    
}


