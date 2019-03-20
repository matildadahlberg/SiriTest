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
        
        let vc = ViewController()
        let on = vc.switchOutlet.isOn = true
        let light = vc.label.text
        
        if vc.switchOutlet.isOn == true {
        completion(SwitchLightsIntentResponse.success(lights: "\(light)", on: "\(on)"))
        }
        else{
            completion(SwitchLightsIntentResponse.failure(failureReason: "doesn't work"))
        }
        
    }

}
