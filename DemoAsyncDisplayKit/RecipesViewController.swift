//
//  RecipesViewController.swift
//  DemoAsyncDisplayKit
//
//  Created by Hung Thai on 1/5/17.
//  Copyright © 2017 Hung. All rights reserved.
//

import AsyncDisplayKit

final class RecipesViewController: ASViewController<ASDisplayNode>, RecipeInteractorOutput {

    private let _collectionNode: ASCollectionNode
    private let _flowlayout: UICollectionViewFlowLayout
    private var _activityIndicatorView: UIActivityIndicatorView?
    private var _recipesDataSource: RecipesDataProvider?
    var handler: RecipeInteractorInput?
    
    init() {
        _flowlayout = UICollectionViewFlowLayout()
      _collectionNode = ASCollectionNode(collectionViewLayout: _flowlayout)
        super.init(node: _collectionNode)
        
        _flowlayout.minimumLineSpacing = 10
        _flowlayout.minimumInteritemSpacing = 10
        initUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        _activityIndicatorView?.hidesWhenStopped = true
        _activityIndicatorView?.sizeToFit()
        
        var refreshRect = _activityIndicatorView!.frame
        refreshRect.origin = CGPoint(x: (view.bounds.size.width - _activityIndicatorView!.frame.width) / 2.0, y: _activityIndicatorView!.frame.midY)
        
        _activityIndicatorView!.frame = refreshRect
        view.addSubview(_activityIndicatorView!)
        
        _activityIndicatorView?.startAnimating()
        handler?.findData()
    }
    
    func initUI() {
        title = "Recipes"
        
        _recipesDataSource = RecipesDataProvider()
        _recipesDataSource!._collectionNode = _collectionNode
        _collectionNode.dataSource = _recipesDataSource!
    }
    
    func foundData(_ recipes: [Recipe]?, error: Error?) {
        guard error == nil else { return }
        _recipesDataSource?.insertNewRecipesInCollectionView(recipes!)
        _activityIndicatorView?.stopAnimating()
    }
    
}
