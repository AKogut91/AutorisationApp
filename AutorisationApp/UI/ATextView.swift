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

enum AttrType {
    case link
    case linkWithOutLine
    case color
}

struct AttributesText {
    var text = ""
    var type: AttrType?
    var value: Any?
}

class ATextView: UITextView, UITextViewDelegate {
    
    weak var aTextViewDelegate: ATextViewDelegate?

    private var originalText: String = ""
    private var attributes: [AttributesText] = []
    private var defaultTextColor = AColor.topTextColor
    private var currentTextColor: UIColor!
    private var currentAligmentText: NSTextAlignment!

    func style(text: String,
               attrs: [AttributesText] = [],
               textColor: UIColor = AColor.topTextColor,
               aligmentText: NSTextAlignment = .center) {

        self.currentAligmentText = aligmentText
        self.delegate = self
        self.backgroundColor = .clear
        self.textAlignment = .center
        self.currentTextColor = textColor
        self.textColor = currentTextColor
        self.defaultTextColor = textColor
        self.originalText = text
        self.attributes = attrs
    }

    func addAttr(_ attr: (AttributesText)) {
        attributes.append(attr)
    }

    func setup() {
        let style = NSMutableParagraphStyle()
        let attributedOriginalText = NSMutableAttributedString(string: originalText)
        style.alignment = currentAligmentText

        let fullRange = NSRange(location: 0, length: attributedOriginalText.length)
        attributedOriginalText.addAttribute(NSAttributedString.Key.foregroundColor, value: defaultTextColor, range: fullRange)
        attributedOriginalText.addAttribute( NSAttributedString.Key.font, value: AFonts.regular.size(.s14), range: fullRange)

        for item in attributes {
            let arange = attributedOriginalText.mutableString.range(of: item.text)
            switch item.type {

            case .link:
                attributedOriginalText.addAttribute(NSAttributedString.Key.link, value: item.value ?? "", range: arange)
                
                self.linkTextAttributes = [
                               kCTForegroundColorAttributeName: UIColor.blue,
                               kCTUnderlineStyleAttributeName: NSUnderlineStyle.single.rawValue
                           ] as [NSAttributedString.Key: Any]
                
            case .linkWithOutLine:
                
                attributedOriginalText.addAttribute(NSAttributedString.Key.link, value: item.value ?? "", range: arange)
                style.alignment = currentAligmentText
                self.linkTextAttributes = [
                    NSAttributedString.Key.foregroundColor: currentTextColor,
                    NSAttributedString.Key.underlineColor: UIColor.clear,
                    NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue
                ] as [NSAttributedString.Key: Any]
                
            case .color:
                var color = UIColor.red
                if let currentColor = item.value as? UIColor { color = currentColor }
                attributedOriginalText.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: arange)
            case .none:
                print("none")
            }
        }

        attributedOriginalText.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: fullRange)

        self.attributedText = attributedOriginalText
    }

    // MARK: - Delegate

    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        self.aTextViewDelegate?.didSelected(item: URL.absoluteString)
        return false
    }

}
