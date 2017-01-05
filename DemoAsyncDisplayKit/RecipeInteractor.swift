//
//  RecipeInteractor.swift
//  DemoAsyncDisplayKit
//
//  Created by Hung Thai on 1/5/17.
//  Copyright © 2017 Hung. All rights reserved.
//

import Foundation

final class RecipeInteractor: RecipeInteractorInput {
    
    var _output: RecipeInteractorOutput?
    var _dataManager: RecipeDataManager?
    
    func findData() {
        _dataManager?.loadData(completion: _output!.foundData)
    }
    
}
