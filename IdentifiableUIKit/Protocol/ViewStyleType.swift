import UIKit

/// This protocol represents a style of UIView
/// Following 3 items must be implemented.
/// - static var shadowStylePropertyDic
/// - static var roundRectRadiusDic
/// - static var borderWidthDic
public protocol ViewStyleType {
    
    /// Dictionaries of style
    static var shadowStylePropertyDic: [String: ShadowStyleProperty] { get }
    static var roundRectRadiusDic: [String: CGFloat] { get }
    static var borderWidthDic: [String: CGFloat] { get }
    
    /// Keys of dictionaries(ordered by asc)
    static var shadowStyleKeyList: [String] { get }
    static var roundRectRadiusKeyList: [String] { get }
    static var borderWidthKeyList: [String] { get }
    
    /// - returns: Style of view
    static func getStylePropertyForView(view: UIView, backgroundColor: UIColor?,
                                        isHalfCircle: Bool, roundRectRadiusKey: String,
                                        shadowStyleKey: String, shadowColor: UIColor?,
                                        borderWidthKey: String, borderColor: UIColor?) -> ViewStyleProperty
}

extension ViewStyleType {
    
    static var shadowStyleKeyList: [String] {
        
        var array = Array(Self.shadowStylePropertyDic.keys)
        
        array.sortInPlace(<)
        
        return array
    }
    
    static var roundRectRadiusKeyList: [String] {
        
        var array = Array(Self.roundRectRadiusDic.keys)

        array.sortInPlace(<)
        
        return array
    }
    
    static var borderWidthKeyList: [String] {
        
        var array = Array(Self.borderWidthDic.keys)
        
        array.sortInPlace(<)
        
        return array
    }
    
    static func getStylePropertyForView(view: UIView, backgroundColor: UIColor?,
                                        isHalfCircle: Bool, roundRectRadiusKey: String,
                                        shadowStyleKey: String, shadowColor: UIColor?,
                                        borderWidthKey: String, borderColor: UIColor?) -> ViewStyleProperty {
        
        // if `isHalfCircle` is true, this value will be half of height of view
        let roundRectRadius = isHalfCircle ? (view.frame.height / 2.0) : (Self.roundRectRadiusDic[roundRectRadiusKey] ?? 0.0)
        
        let shadowStyleProperty = Self.shadowStylePropertyDic[shadowStyleKey]
        
        let borderWidth         = Self.borderWidthDic[borderWidthKey]

        return ViewStyleProperty(backgroundColor: backgroundColor, roundRectRadius: roundRectRadius,
                                 shadowStyleProperty: shadowStyleProperty, shadowColor: shadowColor,
                                 borderWidth: borderWidth, borderColor: borderColor)
    }
}
