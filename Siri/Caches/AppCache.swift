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
    var list: String {get set}

  var lightStates : [String : Bool] {get set}

    
}

private struct CacheKeys {
    static let LightStateKey = "light_state_key"
    static let listKey = "list"
    static let key = "key"
}

extension UserDefaults: Cache {
    
    var lightStates: [String : Bool] {
        get {
            return dictionary(forKey: CacheKeys.key) as! [String : Bool]
        }
        set (newValue) {
          
            set(newValue, forKey: CacheKeys.key)
        }
    }
    
    var list: String {
        get {
            return string(forKey: CacheKeys.listKey) ?? ""
        }
        set {
            set(list, forKey: CacheKeys.listKey)
        }
    }
    
   
 
    var lightState: Bool {

        get { return bool(forKey: CacheKeys.LightStateKey) }
        set { newValue ? set(newValue, forKey: CacheKeys.LightStateKey) : removeObject(forKey: CacheKeys.LightStateKey)}
    }
    
   
}
