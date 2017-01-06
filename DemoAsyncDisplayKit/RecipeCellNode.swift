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
    
    var loadingIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    var imageNode = ASNetworkImageNode()
    var blurView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
    var captionContainerNode = ASDisplayNode()
    var captionLabelNode = AttributedTextNode()
    
    var titleTextNode = ASTextNode()
    
    let recipe: Recipe
    
    var nodeSize: CGSize {
        let spacing: CGFloat = 1
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = floor((screenWidth / 2) - (spacing / 2))
        let itemHeight = floor((screenWidth / 3) - (spacing / 2))
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    init(recipe: Recipe) {
        self.recipe = recipe
        super.init()
//        configureCellNode()
        imageNode = ASNetworkImageNode()
        imageNode.cornerRadius = 5
        imageNode.clipsToBounds = true
        imageNode.url = recipe.url
        
        titleTextNode = createLayerBackedTextNode(attributedString: recipe.name.attributedString(fontSize: 13, color: UIColor.black))
        
        automaticallyManagesSubnodes = true
    }

    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        titleTextNode.style.flexShrink = 1.0
        
        let cellWidth = constrainedSize.max.width
        imageNode.style.preferredSize = CGSize(width: cellWidth, height: cellWidth*(2/3))
        let photoImageViewAbsolute = ASAbsoluteLayoutSpec(children: [imageNode])
        
        let footerStack = ASStackLayoutSpec.horizontal()
        footerStack.alignItems = .center
        footerStack.children = [titleTextNode]
        
        let footerInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let footerWithInset = ASInsetLayoutSpec(insets: footerInsets, child: footerStack)
        
        let layout = ASStackLayoutSpec.vertical()
        layout.alignItems = .stretch
        layout.children = [photoImageViewAbsolute, footerWithInset]
        return layout
    }
    
//    override func calculateLayoutThatFits(_ constrainedSize: ASSizeRange) -> ASLayout {
//        return ASLayout(layoutElement: self, size: nodeSize)
//    }
   
    
    fileprivate func createLayerBackedTextNode(attributedString: NSAttributedString) -> ASTextNode {
        let textNode = ASTextNode()
        textNode.isLayerBacked = true
        textNode.attributedText = attributedString
        
        return textNode
    }
}

private extension RecipeCellNode {
    func configureCellNode() {
        backgroundColor = UIColor.black
        configureImageNode()
        configureCaptionNodes()
    }
    
    func configureImageNode() {
        imageNode = ASNetworkImageNode()
        imageNode.frame = viewFrame()
        imageNode.url = recipe.url
        imageNode.isLayerBacked = true
        addSubnode(imageNode)
    }
    
    func configureCaptionNodes() {
        configureCaptionBlurView()
        configureCaptionContainerNode()
        configureCaptionLabelNode()
    }
    
    func configureCaptionBlurView() {
        blurView.frame = captionContainerFrame()
        view.addSubview(blurView)
    }
    
    func configureCaptionContainerNode() {
        captionContainerNode.frame = captionContainerFrame()
        captionContainerNode.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        captionContainerNode.isLayerBacked = true
        addSubnode(captionContainerNode)
    }
    
    func configureCaptionLabelNode() {
        captionLabelNode.configure(text: recipe.name, size: 12, textAlignment: .center)
        let constrainedSize = CGSize(width: nodeSize.width, height: CGFloat.greatestFiniteMagnitude)
        let labelNodeHeight: CGFloat = captionLabelNode.attributedText!.boundingRect(with: constrainedSize, options: .usesFontLeading, context: nil).height
        let labelNodeYValue = captionContainerFrame().height / 2 - labelNodeHeight / 2
        captionLabelNode.frame = CGRect(x: 0, y: labelNodeYValue, width: nodeSize.width, height: labelNodeHeight)
        captionContainerNode.layer.addSublayer(captionLabelNode.layer)
    }
    
    func captionContainerFrame() -> CGRect {
        let containerHeight: CGFloat = 35
        return CGRect(x: 0, y: nodeSize.height - containerHeight, width: nodeSize.width, height: containerHeight)
    }
    
    func viewFrame() -> CGRect {
        return CGRect(x: 0, y: 0, width: nodeSize.width, height: nodeSize.height)
    }
}

