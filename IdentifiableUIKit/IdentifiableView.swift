import UIKit

/// This class is able to be applied style by specifying ID in Interface Builder
/// Following 4 styles are able to be specify by ID
/// - Background Color
/// - Round Rect
/// - Drop Shadow
/// - Border
/// ---
/// - note: to work properly, background color of view must be clear color
@IBDesignable class IdentifiableView: UIView, ViewStyleIdentifiable, ColorIdentifiable {
    
    // ==========
    // MARK: - Inspectable Variables - View Style

    /// Keys to define colors
    @IBInspectable var backgroundColorKey: String = ""

    /// Keys to define Round Rect
    @IBInspectable var isHalfCircle: Bool = false
    @IBInspectable var roundRectTypeKey: String = ""    // if `isHalfCircle` is true, this value will not be used
    
    /// Keys to define define Drop Shadow
    @IBInspectable var shadowStyleKey: String = ""
    @IBInspectable var shadowColorKey: String = ""
    
    /// Keys to define Border
    @IBInspectable var borderWidthKey: String = ""
    @IBInspectable var borderColorKey: String = ""

    
    // ==========
    // MARK: - ViewStyleIdentifiable
    
    var viewStyle: ViewStyleType.Type? {
        
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
            let backgroundColor = colorStyle.getColor(colorKey: self.backgroundColorKey)
            
            let shadowColor = colorStyle.getColor(colorKey: self.shadowColorKey)
            
            let borderColor = colorStyle.getColor(colorKey: self.borderColorKey)
            
            // apply styles to view
            if let viewStyle = self.viewStyle {
                
                let viewStyleProperty = viewStyle.getStylePropertyForView(self, backgroundColor: backgroundColor,
                                                                          isHalfCircle: self.isHalfCircle, roundRectRadiusKey: self.roundRectTypeKey,
                                                                          shadowStyleKey: self.shadowStyleKey, shadowColor: shadowColor,
                                                                          borderWidthKey: self.borderWidthKey, borderColor: borderColor)
                
                Stylizer.stylizeView(self, viewStyleProperty: viewStyleProperty)
            }
        }
        
        super.drawRect(rect)
    }
}
