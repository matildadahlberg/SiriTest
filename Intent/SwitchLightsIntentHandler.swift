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
    
    func confirm(intent: SwitchLightsIntent,
                 completion: @escaping (SwitchLightsIntentResponse) -> Void) {
        
        completion(SwitchLightsIntentResponse(code: .ready, userActivity: nil))
        
        print("completion ready")
        
        
    }
    
    
    func handle(intent: SwitchLightsIntent, completion: @escaping (SwitchLightsIntentResponse) -> Void) {
        
        //        guard intent.lights != nil else {
        //            completion(SwitchLightsIntentResponse(code: .failure, userActivity: nil))
        //            return
        //        }
        //
        //        guard intent.on != nil else {
        //            completion(SwitchLightsIntentResponse(code: .failure, userActivity: nil))
        //            return
        //        }
        //        guard intent.off != nil else {
        //            completion(SwitchLightsIntentResponse(code: .failure, userActivity: nil))
        //            return
        //        }
        
        
        //        Shared.cache.lightState = true
        
        
        
        
        //        if Shared.cache.lightState == true {
        //            completion(SwitchLightsIntentResponse.successOff(lights: "lights", off: "off"))
        //            Shared.cache.lightState = false
        //
        //
        //        }
        //        if Shared.cache.lightState == false {
        //            completion(SwitchLightsIntentResponse.success(lights: "lights", on: "on"))
        //            Shared.cache.lightState = true
        //
        //        }
        
        let devices = Device(name: "", isOn: true)
        
        if devices.isOn == true {
            completion(SwitchLightsIntentResponse.successOff(lights: "lights", off: "off"))
            devices.isOn = false
            print(devices)
            
        }
        if devices.isOn == false {
            completion(SwitchLightsIntentResponse.success(lights: "lights", on: "on"))
            devices.isOn = true
            print(devices)
            
        }
            
        else {
            completion(SwitchLightsIntentResponse(code: .failure, userActivity: nil))
            
            
            
        }
        
        print("handle success")
        
        
        
        
        
    }
    
}
