//
//  RecipeInteractorIO.swift
//  DemoAsyncDisplayKit
//
//  Created by Hung Thai on 1/5/17.
//  Copyright © 2017 Hung. All rights reserved.
//

import Foundation

protocol RecipeInteractorInput {
    func findData()
}

protocol RecipeInteractorOutput {
    func foundData(_ recipes: [Recipe]?, error: Error?)
}
