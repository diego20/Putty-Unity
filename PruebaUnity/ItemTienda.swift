//
//  ItemTienda.swift
//  JuegoMovilesiOS
//
//  Created by Diego Farfán on 3/4/17.
//  Copyright © 2017 Diego Farfán. All rights reserved.
//

import UIKit

class ItemTienda: NSObject {
    
    var id: Int!
    var nombre: String?
    var precio: String?
    var imagen: UIImage?
    
    init (id: Int) {
        self.id = id
    }

}
