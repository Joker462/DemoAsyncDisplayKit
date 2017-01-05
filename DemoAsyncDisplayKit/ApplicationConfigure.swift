//
//  ApplicationConfigure.swift
//  DemoAsyncDisplayKit
//
//  Created by Hung Thai on 1/5/17.
//  Copyright © 2017 Hung. All rights reserved.
//

import UIKit

class ApplicationConfigure {
    
    weak var recipeVC: RecipesViewController?
    
    func installRootViewControllerIntoWindow(_ window: UIWindow) {
        let recipeVC  = RecipesViewController()
        let recipeNavCtrl = UINavigationController(rootViewController: recipeVC)
        window.rootViewController  = recipeNavCtrl
        
        self.recipeVC = recipeVC
        configure()
    }
    
    fileprivate func configure() {
        let recipeService = RecipeService()
        
        let dataManager = RecipeDataManager(recipeService: recipeService)
        let interactor = RecipeInteractor()
        interactor._dataManager = dataManager
        interactor._output = recipeVC
        
        recipeVC?.handler = interactor
    }

    
}
