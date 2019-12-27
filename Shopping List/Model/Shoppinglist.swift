//
//  Shoppinglist.swift
//  Shopping List
//
//  Created by Aaron Cleveland on 12/27/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingList: Codable, Equatable {
    let name: String
    var added: Bool = false
}
