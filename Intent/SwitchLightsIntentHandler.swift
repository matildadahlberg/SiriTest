//
//  SwitchLightsIntentHandler.swift
//  Intent
//
//  Created by Matilda Dahlberg on 2019-03-18.
//  Copyright © 2019 Matilda Dahlberg. All rights reserved.
//

import Foundation


class SwitchLightsIntentHandler: NSObject, SwitchLightsIntentHandling {
    
    
    func confirm(intent: SwitchLightsIntent,
                 completion: @escaping (SwitchLightsIntentResponse) -> Void) {
        
        completion(SwitchLightsIntentResponse(code: .ready, userActivity: nil))

    }
    
    func handle(intent: SwitchLightsIntent,
                completion: @escaping (SwitchLightsIntentResponse) -> Void) {
     
                completion(SwitchLightsIntentResponse.success(lights: "Lamp"))
        }
}
