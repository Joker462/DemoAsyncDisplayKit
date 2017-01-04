//
//  MeetupFeedViewController.swift
//  DemoAsyncDisplayKit
//
//  Created by Hung Thai Minh on 1/3/17.
//  Copyright © 2017 Hung. All rights reserved.
//


import AsyncDisplayKit


final class MeetupFeedViewController: ASViewController<ASDisplayNode> {

    var _tableNode: ASTableNode
    
    init() {
        _tableNode = ASTableNode()
        super.init(node: _tableNode)
//        setupInitialState()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
}
