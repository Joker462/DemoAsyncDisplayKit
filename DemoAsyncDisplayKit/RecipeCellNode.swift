//
//  RecipeCellNode.swift
//  DemoAsyncDisplayKit
//
//  Created by Hung Thai on 1/5/17.
//  Copyright © 2017 Hung. All rights reserved.
//

import Foundation
import AsyncDisplayKit

final class RecipeCellNode: ASCellNode {
    
    fileprivate var _titleText: ASTextNode!
    fileprivate var _photoImageView: ASNetworkImageNode!
    
    
    init(recipe: Recipe) {
        
        super.init()
        _photoImageView = ASNetworkImageNode()
        _photoImageView.url = recipe.url
        
        _titleText = ASTextNode()
        _titleText = createLayerBackedTextNode(attributedString: recipe.name.attributedString(fontSize: 13, color: UIColor.darkGray))
        
        automaticallyManagesSubnodes = true
    }
    
    
    override func layoutThatFits(_ constrainedSize: ASSizeRange) -> ASLayout {
        
    }
    
    fileprivate func createLayerBackedTextNode(attributedString: NSAttributedString) -> ASTextNode {
        let textNode = ASTextNode()
        textNode.isLayerBacked = true
        textNode.attributedText = attributedString
        
        return textNode
    }
    
}
