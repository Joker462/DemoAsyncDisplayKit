//
//  RecipeService.swift
//  DemoAsyncDisplayKit
//
//  Created by Hung Thai on 1/5/17.
//  Copyright © 2017 Hung. All rights reserved.
//

import Foundation

typealias JSONDictionary = Dictionary<String,Any>
final class RecipeService {
    let demoUrl: String = "http://demo6019678.mockable.io/recipes"
    lazy var session: URLSession = URLSession.shared
    
    func loadRecipeJson(completion: @escaping (_ results: [JSONDictionary]?, _ error: Error?) -> ()) {
        guard let url = URL(string: demoUrl) else {
            fatalError()
        }
        session.dataTask(with: url) { (data, response, error) in
            
            DispatchQueue.main.async(execute: {
                do {
                    let results = try JSONSerialization.jsonObject(with: data!) as? [JSONDictionary]
                    completion(results, nil);
                    
                } catch let underlyingError {
                    completion(nil, underlyingError);
                }
            })
            }.resume()
    }
    
}
