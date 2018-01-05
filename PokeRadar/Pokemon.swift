//
//  Pokemon.swift
//  PokeRadar
//
//  Created by David Garcia on 1/5/18.
//  Copyright © 2018 David Garcia. All rights reserved.
//

import Foundation
import UIKit

class Pokemon: NSObject {
    var id: Int
    var name: String
    var image: UIImage
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
        self.image =  UIImage(named: "\(id).png")!
    }
}
