//
//  UILabelSetUp.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 12/01/24.
//

import Foundation
import UIKit
class UILabelClass{
    extension UILabel {
        typealias MethodHandler = () -> Void
        func addRangeGesture(stringRange: String, function: @escaping MethodHandler) {
            RangeGestureRecognizer.stringRange = stringRange
            RangeGestureRecognizer.function = function
            self.isUserInteractionEnabled = true
            let tapgesture: UITapGestureRecognizer = RangeGestureRecognizer(target: self, action: #selector(tappedOnLabel(_ :)))
            tapgesture.numberOfTapsRequired = 1
            self.addGestureRecognizer(tapgesture)
        }
        
        @objc func tappedOnLabel(_ gesture: RangeGestureRecognizer) {
            guard let text = self.text else { return }
            let stringRange = (text as NSString).range(of: RangeGestureRecognizer.stringRange ?? "")
            if gesture.didTapAttributedTextInLabel(label: self, inRange: stringRange) {
                guard let existedFunction = RangeGestureRecognizer.function else { return }
                existedFunction()
            }
        }
    }
}
