import UIKit

/// This class is able to be applied style by specifying ID in Interface Builder
/// Following 7 styles are able to be specify by ID
/// - Tint Color
/// - Background Color for defualt
/// - Background Color for when highlighted
/// - Round Rect
/// - Border
/// - Text Size
/// - Bold Text
@IBDesignable class IdentifiableButton: UIButton, ButtonStyleIdentifiable, ColorIdentifiable {
    
    // ==========
    // MARK: - Inspectable Variables - Button Style
    
    // TODO: names of variables are too long to show Attribute Inspector
    
    /// Keys to define colors
    @IBInspectable var tintColorKey: String = ""
    @IBInspectable var normalBgColorKey: String = ""
    @IBInspectable var highlightBgColorKey: String = ""

    /// Keys to define Round Rect
    @IBInspectable var isHalfCircle: Bool = false
    @IBInspectable var roundRectTypeKey: String = ""  // if `isHalfCircle` is true, this value will not be used

    /// Keys to define Border
    @IBInspectable var borderWidthKey: String = ""
    @IBInspectable var borderColorKey: String = ""

    /// Keys to define text
    @IBInspectable var textSizeKey: String = "Regular"
    @IBInspectable var isBoldFont: Bool = false


    // ==========
    // MARK: - ButtonStyleIdentifiable
    
    var buttonStyle: ButtonStyleType.Type? {
        
        return nil
    }


    // ==========
    // MARK: - ColorIdentifiable

    var colorStyle: ColorStyleType.Type? {
        
        return nil
    }

    
    // ==========
    // MARK: - Lifecycle
    
    /// Apply styles specified by ID
    override func drawRect(rect: CGRect) {
        
        if let colorStyle = self.colorStyle {
            
            // get colors before applying styles
            let tintColor = colorStyle.getColor(colorKey: self.tintColorKey)
            
            let backgroundColorNormal = colorStyle.getColor(colorKey: self.normalBgColorKey)
            
            let backgroundColorHighlighted = colorStyle.getColor(colorKey: self.highlightBgColorKey)
            
            let borderColor = colorStyle.getColor(colorKey: self.borderColorKey)
            
            // apply styles to button
            if let buttonStyle = self.buttonStyle {
                
                let buttonStyleProperty = buttonStyle.getStylePropertyForButton(self, tintColor: tintColor,
                                                                                backgroundColorNormal: backgroundColorNormal, backgroundColorHighlighted: backgroundColorHighlighted,
                                                                                isHalfCircle: self.isHalfCircle, roundRectRadiusKey: self.roundRectTypeKey,
                                                                                borderWidthKey: self.borderWidthKey, borderColor: borderColor,
                                                                                textSizeKey: self.textSizeKey, isBoldFont: self.isBoldFont)
                
                Stylizer.stylizeButton(self, buttonStyleProperty: buttonStyleProperty)
            }
        }
        
        super.drawRect(rect)
    }
}
