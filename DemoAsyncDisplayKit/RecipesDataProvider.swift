//
//  RecipesDataProvider.swift
//  DemoAsyncDisplayKit
//
//  Created by Hung Thai on 1/5/17.
//  Copyright © 2017 Hung. All rights reserved.
//

import Foundation
import AsyncDisplayKit

final class RecipesDataProvider:NSObject, ASCollectionDataSource {
    var _recipes: [Recipe]?
    weak var _collectionNode: ASCollectionNode?
    
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return _recipes?.count ?? 0
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        let recipe = _recipes![indexPath.row]
        let cellBlockNode = { () -> ASCellNode in
            return RecipeCellNode(recipe: recipe)
        }
        return cellBlockNode
    }
    
//    func collectionNode(_ collectionNode: ASCollectionNode, nodeForItemAt indexPath: IndexPath) -> ASCellNode {
//        let recipe = _recipes![indexPath.row]
//        return RecipeCellNode(recipe: recipe)
//    }
    
    func insertNewRecipesInCollectionView(_ recipes: [Recipe]) {
        _recipes = recipes
        
        let section = 0
        var indexPaths = [IndexPath]()
        recipes.enumerated().forEach { (row, recipe) in
            let path = IndexPath(row: row, section: section)
            indexPaths.append(path)
        }
        _collectionNode?.insertItems(at: indexPaths)
    }
    
}
