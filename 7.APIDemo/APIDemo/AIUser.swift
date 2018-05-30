//
//  AIUser.swift
//  APIDemo
//
//  Created by agilemac-74 on 02/05/18.
//  Copyright © 2018 Agile. All rights reserved.
//

import UIKit

struct USER_KEYS {
    static let firstName:String = "f_name"
     static let lastName:String = "l_name"
     static let city:String = "city"
     static let zipcode:String = "zipCode"
     static let number:String = "number"
    
}
class AIUser: NSObject {
    
    var firstName:String = ""
    var lastName:String = ""
    var city:String = ""
    var phoneNumber:String = ""
    var zipCode:String = ""
    var zipCodeInt:Int = -1
    var name:String = ""
    
    override init() {
        
    }
    
    
    init(withDetails details:[String:Any]) {
        super.init()
        
        if let value:String = details[USER_KEYS.firstName] as? String{
            self.firstName = value
        }
        if let value:String = details[USER_KEYS.lastName] as? String{
            self.lastName = value
        }
        if let value:String = details[USER_KEYS.number] as? String{
            self.phoneNumber = value
        }
        if let value:String = details[USER_KEYS.city] as? String{
         self.city = value
        }
        if let value:String = details[USER_KEYS.zipcode] as? String{
            self.zipCode = value
            self.zipCodeInt = Int(self.zipCode)!
        }
        self.name = "\(self.firstName) \(self.lastName)"
    }
}
