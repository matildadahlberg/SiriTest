//
//  AppCache.swift
//  Siri
//
//  Created by Elyas Naranjee on 2019-03-22.
//  Copyright © 2019 Matilda Dahlberg. All rights reserved.
//

import Foundation

protocol Cache {
    
    var devices: [Device] {get set}
}

private struct CacheKeys {

    static let DevicesKey = "devices"
}

extension UserDefaults: Cache {
    
    var devices: [Device] {
        get {
            
            guard let devicesData = object(forKey: CacheKeys.DevicesKey) as? Data else {
                print("Failed to read from user defaults")
                return []
            }
            
            guard let devicesArray = NSKeyedUnarchiver.unarchiveObject(with: devicesData) as? [Device] else {
                print("Failed to read from user defaults")
                return []
            }
            
            return devicesArray
        }
        set {
            guard let data = try? NSKeyedArchiver.archivedData(withRootObject: newValue, requiringSecureCoding: false) else {
                assertionFailure("Failed to write to user defaults")
                return
            }
            
            setValue(data, forKey: CacheKeys.DevicesKey)
        }
    }
   
}






