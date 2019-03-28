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
            
            do {
                let devices = try JSONDecoder().decode([Device].self, from: devicesData)
                return devices
            } catch {
                print("something went wrong decoding json to Devices \(error)")
                return []
            }
        }
        set {
            do {
                let jsonData: Data = try JSONEncoder().encode(newValue)
                setValue(jsonData, forKey: CacheKeys.DevicesKey)
            } catch (let error) {
                print("something went wrong trying to make json from Device, \(error)")
            }
        }
    }
   
}






