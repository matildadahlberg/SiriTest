//
//  IntentHandler.swift
//  Intent
//
//  Created by Matilda Dahlberg on 2019-03-18.
//  Copyright © 2019 Matilda Dahlberg. All rights reserved.
//

import Intents

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any {
        print(#function)
        guard intent is SwitchLightsIntent else {
            fatalError("Unhandled intent type: \(intent)")
        }
        return SwitchLightsIntentHandler()
    }
    
}
