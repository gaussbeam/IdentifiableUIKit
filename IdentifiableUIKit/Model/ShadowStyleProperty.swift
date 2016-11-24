import UIKit

/// ShadowStyleProperty stores propeties for `CAShapeLayer`
public struct ShadowStyleProperty {
    
    /// equivalents for CAShapeLayer.shadowOpacity
    var opacity: Float
    
    /// equivalents for CAShapeLayer.shadowOffset
    var offset: CGSize
    
    /// equivalents for CAShapeLayer.shadowRadius
    var radius: CGFloat
}