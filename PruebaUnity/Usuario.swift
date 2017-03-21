//
//  Element.swift
//  JuegoMovilesiOS
//
//  Created by Diego Farfán on 18/02/17.
//  Copyright © 2017 Diego Farfán. All rights reserved.
//

import UIKit

class Usuario: NSObject {
    
    var username: String?
    var nombre: String?
    var password: String?
    
    override init () {
        super.init()
    }
    convenience init(_ dictionary: Dictionary<String, AnyObject>) {
        self.init()
        username = dictionary["username"] as? String
        nombre = dictionary["name"] as? String
        password = dictionary["password"] as? String
    }
    
}
