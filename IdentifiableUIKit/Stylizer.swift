import UIKit


/// Utility class to apply styles to view
class Stylizer {

    // MARK: - Common

    /// Check whether color is visible
    /// - note: Checking by alpha did not implement
    private static func isInvisible(color: UIColor?) -> Bool {
        
        return color == nil || color == UIColor.clearColor()
    }
}


// MARK: - Extension - Stylize view

/// Stylize view
/// Following 4 styles are able to be specify by ID
/// - Background Color
/// - Round Rect
/// - Drop Shadow
/// - Border
extension Stylizer {
    
    /// Apply style to view(wrapper function)
    static func stylizeView(view: UIView, viewStyleProperty: ViewStyleProperty) {
        
        self.stylizeView(view, backgroundColor: viewStyleProperty.backgroundColor,
                         roundRectRadius: viewStyleProperty.roundRectRadius,
                         shadowStyleProperty: viewStyleProperty.shadowStyleProperty, shadowColor: viewStyleProperty.shadowColor,
                         borderWidth: viewStyleProperty.borderWidth, borderColor: viewStyleProperty.borderColor)
    }
    
    /// Apply style to view
    static func stylizeView(view: UIView, backgroundColor: UIColor?, roundRectRadius: CGFloat?,
                            shadowStyleProperty: ShadowStyleProperty?, shadowColor: UIColor?,
                            borderWidth: CGFloat?, borderColor: UIColor?)
    {
        
        // identifier of layer
        let styleLayerName = "styleLayer"
        
        
        // -----
        // if the layer to apply style already exists, remove it
        if let subLayerList = view.layer.sublayers {
            
            for sublayer in subLayerList {
                
                if sublayer.name == styleLayerName {
                    
                    sublayer.removeFromSuperlayer()
                }
            }
        }
        
        
        // -----------
        // layer to apply style
        let styleLayer = CAShapeLayer()
        
        styleLayer.name = styleLayerName
        
        
        // ----------
        // background color
        // background color is define by layer's background color
        view.backgroundColor = UIColor.clearColor()
        
        if let bgColor = backgroundColor {
            
            styleLayer.fillColor = bgColor.CGColor
        }
        
        
        // ----------
        // rounded rect
        if let radius = roundRectRadius where radius >= 0.0 {
            
            styleLayer.path = UIBezierPath(roundedRect: view.bounds, cornerRadius: radius).CGPath
        }
        
        
        // ----------
        // drop shadow
        if  shadowStyleProperty == nil || isInvisible(shadowColor) {
            
            // do nothing
        } else {
            
            styleLayer.shadowPath = styleLayer.path
            styleLayer.shadowColor = shadowColor!.CGColor
            styleLayer.shadowOpacity = shadowStyleProperty!.opacity
            styleLayer.shadowOffset = shadowStyleProperty!.offset
            styleLayer.shadowRadius = shadowStyleProperty!.radius
        }
        
        
        // ----------
        // border
        // TODO: if view is not rounded rect, border breaks at top-left corner
        if borderWidth == nil || isInvisible(borderColor) {
            
            // do nothing
        } else {
            
            styleLayer.strokeColor = borderColor!.CGColor
            styleLayer.lineWidth = borderWidth!
        }
        
        // apply layer to view
        view.layer.insertSublayer(styleLayer, atIndex: 0)
        
        // triming view disabled (to show drop shadow)
        view.layer.masksToBounds = false
        view.clipsToBounds = false
    }
}


// MARK: - Extension - Stylize label

/// Stylize label
/// Following 3 styles are able to be specify by ID
/// - Text Color
/// - Text Size
/// - Bold Text
extension Stylizer {
    
    /// Apply style to label(wrapper function)
    static func stylizeLabel(label: UILabel, labelStyleProperty: LabelStyleProperty) {
        
        self.stylizeLabel(label,
                          textColor: labelStyleProperty.textColor,
                          font: labelStyleProperty.font)
    }
    
    /// Apply style to label
    static func stylizeLabel(label: UILabel, textColor: UIColor?, font: UIFont) {
        
        label.font = font
        
        label.textColor = textColor ?? UIColor.blackColor()
    }
}


// MARK: - Extension - Stylize button

/// Stylize button
/// Following 7 styles are able to be specify by ID
/// - Tint Color
/// - Background Color for defualt
/// - Background Color for when highlighted
/// - Round Rect
/// - Border
/// - Text Size
/// - Bold Text
extension Stylizer {
    
    /// Apply style to button(wrapper function)
    static func stylizeButton(button: UIButton, buttonStyleProperty: ButtonStyleProperty) {
        
        self.stylizeButton(button, tintColor: buttonStyleProperty.tintColor,
                           backgroundColorNormal: buttonStyleProperty.backgroundColorNormal, backgroundColorHighlighted: buttonStyleProperty.backgroundColorHighlighted,
                           roundRectRadius: buttonStyleProperty.roundRectRadius,
                           borderWidth: buttonStyleProperty.borderWidth, borderColor: buttonStyleProperty.borderColor,
                           font: buttonStyleProperty.font)
    }
    
    /// Apply style to button
    static func stylizeButton(button: UIButton, tintColor: UIColor?,
                              backgroundColorNormal: UIColor?, backgroundColorHighlighted: UIColor?,
                              roundRectRadius: CGFloat?,
                              borderWidth: CGFloat?, borderColor: UIColor?, font: UIFont)
    {

        // ----------
        // tint color
        button.tintColor = tintColor ?? UIColor.blackColor()
        
        
        // ----------
        // background color

        // normal
        button.layer.backgroundColor = backgroundColorNormal?.CGColor

        // highlighted
        if let bgColorHighlighted = backgroundColorHighlighted {
            
            let highlitedImage = Stylizer.imageWithColor(bgColorHighlighted)
            button.setBackgroundImage(highlitedImage, forState: .Highlighted)
        }
        
        
        // ----------
        // rounded rect
        if let radius = roundRectRadius where radius >= 0.0 {
            
            button.layer.cornerRadius = radius
        }

        
        // ----------
        // border
        if borderWidth == nil || isInvisible(borderColor) {
            
            // do nothing
        } else {
            
            button.layer.borderColor = borderColor?.CGColor
            button.layer.borderWidth = borderWidth! // borderWidth is never nil
        }
        
        
        // ----------
        // font
        button.titleLabel?.font = font
        
        button.clipsToBounds = true
    }

    /// Generate UIImage by UIColor
    /// - note: by http://qiita.com/wasnot/items/3537d932e9550a5c4c27
    private static func imageWithColor(color: UIColor) -> UIImage {
        
        let rect = CGRectMake(0.0, 0.0, 1.0, 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
}
