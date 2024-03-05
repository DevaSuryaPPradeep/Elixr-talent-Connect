//
//  DesignableUITextField.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 12/01/24.
//

import Foundation
import UIKit
@IBDesignable
/// IBDesignable  to UITextfield  that will add features to the  attribute inspector of the uitextfield.
public class DesignableUITextField: UITextField {
    
    // Provides left padding for images
    public override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding
        return textRect
    }
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            guard let  placeholderText = self.placeholder else {
                self.attributedPlaceholder = NSAttributedString(string:  "",attributes: [NSAttributedString.Key.foregroundColor:newValue ?? UIColor.gray])
                return
            }
            self.attributedPlaceholder = NSAttributedString(string:  placeholderText,attributes: [NSAttributedString.Key.foregroundColor: newValue ?? UIColor.gray])
        }
    }
    @IBInspectable var leftPadding: CGFloat = 0
    
    @IBInspectable var color: UIColor = UIColor.lightGray {
        didSet {
            updateView()
        }
    }
    func updateView() {
        if let image = leftImage {
            leftViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            imageView.tintColor = color
            leftView = imageView
        } else {
            leftViewMode = UITextField.ViewMode.never
            leftView = nil
        }
    }
}
