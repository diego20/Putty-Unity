//
//  GlobalVariables.swift
//  JuegoMovilesiOS
//
//  Created by Diego Farfán on 3/5/17.
//  Copyright © 2017 Diego Farfán. All rights reserved.
//
import UIKit
import Foundation

class GlobalVariables: NSObject {
    
    var itemsDisponibles: [ItemTienda] = []
    var itemsComprados: [ItemTienda] = []
    
    static let sharedInstance = GlobalVariables()

    private override init() {
        let item: ItemTienda = ItemTienda.init(id: 0)
        item.nombre = "Sombrero mágico"
        item.precio = "200 pts."
        item.imagen = UIImage(named: "magic-hat")
        let item2: ItemTienda = ItemTienda.init(id: 1)
        item2.nombre = "Gafas de aviador"
        item2.precio = "500 pts."
        item2.imagen = UIImage(named: "aviator-sunglasses")
        let item3: ItemTienda = ItemTienda.init(id: 2)
        item3.nombre = "Gafas Rojas"
        item3.precio = "1000 pts."
        item3.imagen = UIImage(named: "rayban-sunglasses")
        let item4: ItemTienda = ItemTienda.init(id: 3)
        item4.nombre = "Bigote Mexicano"
        item4.precio = "1200 pts."
        item4.imagen = UIImage(named: "classic-moustache")
        let item5: ItemTienda = ItemTienda.init(id: 4)
        item5.nombre = "Bigote alargado"
        item5.precio = "1400 pts."
        item5.imagen = UIImage(named: "chinese-moustache")
        
        itemsDisponibles.append(item)
        itemsDisponibles.append(item2)
        itemsDisponibles.append(item3)
        itemsDisponibles.append(item4)
        itemsDisponibles.append(item5)
        
        let itemCompra1: ItemTienda = ItemTienda.init(id: 0)
        itemCompra1.nombre = "Cadena de oro"
        itemCompra1.precio = "800 pts."
        itemCompra1.imagen = UIImage(named: "bling-collar")
        let itemCompra2: ItemTienda = ItemTienda.init(id: 1)
        itemCompra2.nombre = "Gafas Hippies"
        itemCompra2.precio = "1000 pts."
        itemCompra2.imagen = UIImage(named: "hippie-sunglasses")
        let itemCompra3: ItemTienda = ItemTienda.init(id: 2)
        itemCompra3.nombre = "Peinado desordenado"
        itemCompra3.precio = "1200 pts."
        itemCompra3.imagen = UIImage(named: "funny-haircut")
        
        itemsComprados.append(itemCompra1)
        itemsComprados.append(itemCompra2)
        itemsComprados.append(itemCompra3)
    }
    
}
