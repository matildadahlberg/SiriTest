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
        
        guard intent.lights != nil else {
            completion(SwitchLightsIntentResponse(code: .failure, userActivity: nil))
            return
        }

        guard intent.on != nil else {
            completion(SwitchLightsIntentResponse(code: .failure, userActivity: nil))
            return
        }
        guard intent.off != nil else {
            completion(SwitchLightsIntentResponse(code: .failure, userActivity: nil))
            return
        }
        
        
        Shared.cache.lightState = true
        
        if Shared.cache.lightState == true {
            completion(SwitchLightsIntentResponse.success(lights: "lights", on: "on"))
        }
//        if Shared.cache.lightState == false {
//            completion(SwitchLightsIntentResponse.successOff(lights: "lights", off: "off"))
//        }
        else {
            completion(SwitchLightsIntentResponse(code: .failure, userActivity: nil))
        }
        
        
    }

}
