import UIKit

public struct ButtonStyleProperty {
    
    /// Colors
    var tintColor: UIColor?
    var backgroundColorNormal: UIColor?
    var backgroundColorHighlighted: UIColor?
    
    /// Rounded Rect Style
    var roundRectRadius: CGFloat
    
    /// Border Style
    var borderWidth: CGFloat?
    var borderColor: UIColor?
    
    /// Text Style
    /// - note: color of label is defined with tintColor
    var font: UIFont
}