//
//  RecipeDataManager.swift
//  DemoAsyncDisplayKit
//
//  Created by Hung Thai on 1/5/17.
//  Copyright © 2017 Hung. All rights reserved.
//

import Foundation

final class RecipeDataManager {
    fileprivate var _recipeService: RecipeService?
    
    init(recipeService: RecipeService) {
        _recipeService = recipeService
    }
    
    func loadData(completion: @escaping ( _ recipes: [Recipe]?, _ error: Error?) -> ()) {
        _recipeService?.loadRecipeJson(completion: { (result, error) in
            guard error == nil else { completion(nil, error); return }
            
            let recipes = result?.flatMap(self.recipeItemFromJSONDictionary)
            completion(recipes, nil)
        })
    }
}

extension RecipeDataManager {
    func recipeItemFromJSONDictionary(_ entry: JSONDictionary) -> Recipe? {
        guard let name = entry["name"] as? String, let url = entry["imageURL"] as? String else {
            return nil
        }
        return Recipe(name: name, url: URL(string: url)!)
    }
}
