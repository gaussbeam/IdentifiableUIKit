import UIKit

public struct ViewStyleProperty {

    /// Color
    var backgroundColor: UIColor?
    
    /// Rounded Rect Style
    var roundRectRadius: CGFloat
    
    /// Dropshadow Style
    var shadowStyleProperty: ShadowStyleProperty?
    var shadowColor: UIColor?

    /// Border Style
    var borderWidth: CGFloat?
    var borderColor: UIColor?
}