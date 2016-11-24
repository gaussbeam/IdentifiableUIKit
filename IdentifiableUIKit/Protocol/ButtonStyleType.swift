import UIKit

/// This protocol represents a style of UIButton
/// Following 3 items must be implemented.
/// - static var roundRectRadiusDic
/// - static var borderWidthDic
/// - static var textSizeDic
public protocol ButtonStyleType {
    
    /// Dictionaries of style
    static var roundRectRadiusDic: [String: CGFloat] { get }
    static var borderWidthDic: [String: CGFloat] { get }
    static var textSizeDic: [String: CGFloat] { get }
    
    /// Keys of dictionaries(ordered by asc)
    static var roundRectRadiusKeyList: [String] { get }
    static var borderWidthKeyList: [String] { get }
    static var textSizeKeyList: [String] { get }
    
    /// - returns: Style of button
    static func getStylePropertyForButton(button: UIButton, tintColor: UIColor?,
                                          backgroundColorNormal: UIColor?, backgroundColorHighlighted: UIColor?,
                                          isHalfCircle: Bool, roundRectRadiusKey: String,
                                          borderWidthKey: String, borderColor: UIColor?,
                                          textSizeKey: String, isBoldFont: Bool) -> ButtonStyleProperty
}

extension ButtonStyleType {
    
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
    
    static var textSizeKeyList: [String] {
        
        var array = Array(self.textSizeDic.keys)
        
        array.sortInPlace(<)
        
        return array
    }
    
    static func getStylePropertyForButton(button: UIButton, tintColor: UIColor?,
                                          backgroundColorNormal: UIColor?, backgroundColorHighlighted: UIColor?,
                                          isHalfCircle: Bool, roundRectRadiusKey: String,
                                          borderWidthKey: String, borderColor: UIColor?,
                                          textSizeKey: String, isBoldFont: Bool) -> ButtonStyleProperty {
        

        let roundRectRadius = isHalfCircle ? (button.frame.height / 2.0) : (Self.roundRectRadiusDic[roundRectRadiusKey] ?? 0.0)
        
        let borderWidth         = Self.borderWidthDic[borderWidthKey]
        
        let size = Self.textSizeDic[textSizeKey] ?? 100
        let font = isBoldFont ? UIFont.boldSystemFontOfSize(size) : UIFont.systemFontOfSize(size)
        
        return ButtonStyleProperty(tintColor: tintColor, backgroundColorNormal: backgroundColorNormal, backgroundColorHighlighted: backgroundColorHighlighted,
                                   roundRectRadius: roundRectRadius,
                                   borderWidth: borderWidth, borderColor: borderColor,
                                   font: font)
    }
}
