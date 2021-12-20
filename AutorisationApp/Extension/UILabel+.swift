//
//  UILabel+.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 16.12.2021.
//

import Foundation
import UIKit

extension UILabel {
    
    func setMargins(margin: CGFloat = 10) {
        if let textString = self.text {
            var paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.firstLineHeadIndent = margin
            paragraphStyle.headIndent = margin
            paragraphStyle.tailIndent = -margin
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
            attributedText = attributedString
        }
    }
    
    func underlineTwoText(range1:String, range2:String) {
        if let textString = self.text {
            let str = NSString(string: textString)
            let firstRange = str.range(of: range1)
            let secRange = str.range(of: range2)
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttributes([NSAttributedString.Key.foregroundColor : AColor.purpleColor,
                                            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue as Any],range: firstRange)
            attributedString.addAttributes([NSAttributedString.Key.foregroundColor : AColor.purpleColor,
                                            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue as Any],range: secRange)
            attributedText = attributedString
        }
    }
    
    func underlineOneText(range:String) {
        
       if let strSignup = self.text {
            let rangeSignUp = NSString(string: strSignup).range(of: range, options: String.CompareOptions.caseInsensitive)
            let rangeFull = NSString(string: strSignup).range(of: strSignup, options: String.CompareOptions.caseInsensitive)
            let attrStr = NSMutableAttributedString.init(string:strSignup)
         
         attrStr.addAttributes([NSAttributedString.Key.foregroundColor : AColor.purpleColor],range: rangeFull)
         attrStr.addAttributes([NSAttributedString.Key.foregroundColor : AColor.purpleColor,
                                  NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue as Any],range: rangeSignUp)
         attributedText = attrStr
        }
    }

}
