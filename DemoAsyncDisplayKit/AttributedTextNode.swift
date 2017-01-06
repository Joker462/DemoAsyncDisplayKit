//
//  NSAttributedString+Additions.swift
//  BrowseMeetup
//
//  Created by Ziad on 10/23/16.
//  Copyright © 2016 Intensify Studio. All rights reserved.
//

import UIKit
import AsyncDisplayKit

extension String {
    
    func attributedString(fontSize: CGFloat, color: UIColor) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        
        let attributes = [NSForegroundColorAttributeName: color, NSFontAttributeName: UIFont.systemFont(ofSize: fontSize)]
        attributedString.addAttributes(attributes, range: NSMakeRange(0, self.characters.count))
        
        return attributedString
    }
}

class AttributedTextNode: ASTextNode {
    func configure(text: String, size: CGFloat, color: UIColor = UIColor.white, textAlignment: NSTextAlignment = .left) {
        let mutableString = NSMutableAttributedString(string: text)
        let range = NSMakeRange(0, text.characters.count)
        mutableString.addAttribute(NSFontAttributeName, value: UIFont.systemFont(ofSize: size), range: range)
        mutableString.addAttribute(NSForegroundColorAttributeName, value: color, range: range)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = textAlignment
        mutableString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: range)
        attributedText = mutableString
    }
}
