//
//  UITextField+TextInsets.swift
//  MyNews
//
//  Created by Aksilont on 14.02.2023.
//

import UIKit

class InputTextField: UITextField {
    
    var textInsets = UIEdgeInsets.zero {
        didSet { setNeedsDisplay() }
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: textInsets)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: textInsets)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: textInsets)
    }
}
