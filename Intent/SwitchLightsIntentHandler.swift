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
        

        let weHaveADeviceWithTheRequestedName = Shared.cache.devices.contains(where: { (device) -> Bool in
            return device.name == intent.deviceName
        })
        
        if weHaveADeviceWithTheRequestedName {
            completion(SwitchLightsIntentResponse(code: .success, userActivity: nil))
        } else {
            completion(SwitchLightsIntentResponse(code: .failure, userActivity: nil))
        }
    }
    
    
    func handle(intent: SwitchLightsIntent, completion: @escaping (SwitchLightsIntentResponse) -> Void) {
        print("we handling an intent: \n\(intent)")
        
         
        guard intent.powerState != .unknown else {
            print("powerState was unknown, giving up")
            completion(SwitchLightsIntentResponse(code: .failure, userActivity: nil))
            return
        }
        
        let changedList = Shared.cache.devices.map { (immutableDevice) -> Device in
            guard immutableDevice.name == intent.deviceName else {
                return immutableDevice
            }
            
            var mutableDevice = immutableDevice

            switch intent.powerState {
            case .on: mutableDevice.isOn = true
            case .off: mutableDevice.isOn = false
            case .unknown: ()
            }
            
            return mutableDevice
        }
        
        Shared.cache.devices = changedList
        if intent.powerState == .on{
            completion(SwitchLightsIntentResponse.success(deviceName: intent.deviceName!, powerState: .on))
            
            
        }
        else if intent.powerState == .off {
            completion(SwitchLightsIntentResponse.success(deviceName: intent.deviceName!, powerState: .off))
        }
//        completion(SwitchLightsIntentResponse(code: .success, userActivity: nil))
  }
    
    
}


