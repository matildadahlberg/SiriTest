//
//  AppCache.swift
//  Siri
//
//  Created by Elyas Naranjee on 2019-03-22.
//  Copyright © 2019 Matilda Dahlberg. All rights reserved.
//

import Foundation

protocol Cache {
    var lightState: Bool {get set}
}

private struct CacheKeys {
    static let LightStateKey = "light_state_key"
}

extension UserDefaults: Cache {
    
    var lightState: Bool {
        
        get { return bool(forKey: CacheKeys.LightStateKey) }
        set { newValue ? set(newValue, forKey: CacheKeys.LightStateKey) : removeObject(forKey: CacheKeys.LightStateKey)}
    }
}
