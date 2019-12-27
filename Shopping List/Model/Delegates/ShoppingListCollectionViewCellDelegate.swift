//
//  ShoppingListCollectionViewCellDelegate.swift
//  Shopping List
//
//  Created by Aaron Cleveland on 12/27/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

protocol ShoppingListCollectionViewCellDelegate: AnyObject {
    
    func ItemTapped(forItem item: ShoppingListCollectionViewCell)
}
