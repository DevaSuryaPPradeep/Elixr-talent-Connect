import UIKit
import Foundation
@IBDesignable

/// IBDesignable  to UIButton  that will add features to the  attribute inspector of the UIbutton.
class UIButtonSetup:UIButton {
        @IBInspectable var borderColor: UIColor? {
            set {
                guard let uiColor = newValue else { return }
                layer.borderColor = uiColor.cgColor
            }
            get {
                guard let color = layer.borderColor else { return nil }
                return UIColor(cgColor: color)
            }
        }
    @IBInspectable var cornerRadius: CGFloat {
           set {
               layer.cornerRadius = newValue
           }
           get {
               return layer.cornerRadius
           }
       }
        @IBInspectable var borderWidth: CGFloat {
            get { layer.borderWidth }
            set { layer.borderWidth = newValue }
        }
        override init(frame: CGRect) {
            super.init(frame: frame)
        }
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }
}
