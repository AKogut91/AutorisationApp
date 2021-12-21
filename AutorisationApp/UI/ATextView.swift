//
//  ATextView.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 20.12.2021.
//

import Foundation
import UIKit

protocol ATextViewDelegate: AnyObject {
    func didSelected(item: String)
}

class ATextView: UITextView, UITextViewDelegate {
    
    enum ATextViewType {
        case undeline
    }
    
    enum AttrType {
        case link
        case color
    }
    
    var aTextViewDelegate: ATextViewDelegate?
    
    private var originalText: String = ""
    private var attributes: [(text: String, type: AttrType, value: Any)] = []
    
    func style(type: ATextViewType,text: String, attrs: [(text: String, type: AttrType, value: Any)] = []){
        
        self.delegate = self
        self.backgroundColor = .clear
        self.textAlignment = .center
        self.textColor = AColor.topTextColor
        
        switch type {
        case .undeline:
            originalText = text
            attributes = attrs
        }
    }
    
    func addAttr(_ attr: (text: String, type: AttrType, value: Any)) {
        attributes.append(attr)
    }
    
    func setup() {
        let style = NSMutableParagraphStyle()
        let attributedOriginalText = NSMutableAttributedString(string: originalText)
        style.alignment = .center
        
        let fullRange = NSMakeRange(0, attributedOriginalText.length)
        attributedOriginalText.addAttribute(NSAttributedString.Key.foregroundColor, value: AColor.topTextColor, range: fullRange)
        attributedOriginalText.addAttribute( NSAttributedString.Key.font, value: AFont.init().style(fontStyle: .Normal, size: .s14), range: fullRange)
        
        for item in attributes {
            let arange = attributedOriginalText.mutableString.range(of: item.text)
            switch item.type {
                
            case .link:
                attributedOriginalText.addAttribute(NSAttributedString.Key.link, value: item.value, range: arange)

            case .color:
                var color = UIColor.red
                if let c = item.value as? UIColor { color = c }
                attributedOriginalText.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: arange)
            default:
                break
            }
        }
        
        attributedOriginalText.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: fullRange)
        
        self.linkTextAttributes = [
                       kCTForegroundColorAttributeName: UIColor.blue,
                       kCTUnderlineStyleAttributeName: NSUnderlineStyle.single.rawValue,
                   ] as [NSAttributedString.Key : Any]
        
        self.attributedText = attributedOriginalText
    }
    
    
    // MARK: - Delegate
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        self.aTextViewDelegate?.didSelected(item: URL.absoluteString)
        return false
    }

}
