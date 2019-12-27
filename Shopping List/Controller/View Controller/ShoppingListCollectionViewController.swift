//
//  ShoppinglistCollectionViewController.swift
//  Shopping List
//
//  Created by Aaron Cleveland on 12/27/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewController: UICollectionViewController {
    
    struct PropertyKeys {
        static let itemCell = "ItemCell"
        static let orderSegue = "ShowSubmitOrderSegue"
        static let addedHeader = "AddedHeader"
    }
    
    let shoppingItemController = ShoppingListController()

    override func viewDidLoad() {
        super.viewDidLoad()
        shoppingItemController.fetchItems()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let submitOrderVC = segue.destination as? SubmitOrderViewController else { return }
        submitOrderVC.itemCount = shoppingItemController.shoppingItems.filter( {$0.added} ).count
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            print(shoppingItemController.notAddedShoppingItems.count)
            return shoppingItemController.addedShoppingItems.count
        default:
            return shoppingItemController.notAddedShoppingItems.count
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PropertyKeys.itemCell, for: indexPath) as? ShoppingListCollectionViewCell else { return UICollectionViewCell() }
        cell.shoppingController = shoppingItemController
        cell.delegate = self
        cell.shoppingItem = itemFor(indexPath)
        return cell
    }
    
    private func itemFor(_ indexPath: IndexPath) -> ShoppingList {
        switch indexPath.section {
        case 0:
            return shoppingItemController.addedShoppingItems[indexPath.item]
        default:
            return shoppingItemController.notAddedShoppingItems[indexPath.item]
        }
    }
}

extension ShoppingListCollectionViewController: ShoppingListCollectionViewCellDelegate {
    func ItemTapped(forItem item: ShoppingListCollectionViewCell) {
        guard let shoppingItem = item.shoppingItem else { return }
        shoppingItemController.itemAddedToggled(for: shoppingItem)
        collectionView?.reloadData()
    }
}

