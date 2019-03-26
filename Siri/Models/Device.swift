//
//  Device.swift
//  Siri
//
//  Created by Matilda Dahlberg on 2019-03-26.
//  Copyright © 2019 Matilda Dahlberg. All rights reserved.
//

import Foundation

class Device : NSObject, NSCoding {
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(isOn, forKey: "isOn")
    }
    
    required init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: "name") as? String else {
            return nil
        }
        self.isOn = aDecoder.decodeBool(forKey: "isOn")
        
        self.name = name

    }
    
    var name: String
    var isOn: Bool
    
    init(name: String, isOn: Bool) {
        self.name = name
        self.isOn = isOn
    }
}



