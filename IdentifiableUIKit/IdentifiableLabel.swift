import UIKit

/// This class is able to be applied style by specifying ID in Interface Builder
/// Following 3 styles are able to be specify by ID
/// - Text Color
/// - Text Size
/// - Bold Text
@IBDesignable class IdentifiableLabel: UILabel, LabelStyleIdentifiable, ColorIdentifiable {
    
    // ==========
    // MARK: - Inspectable Variables - Text Style
    
    /// Keys to define text
    @IBInspectable var textColorKey: String = ""
    @IBInspectable var textSizeKey: String = "Regular"
    @IBInspectable var isBoldFont: Bool = false


    // ==========
    // MARK: - LabelStyleIdentifiable

    var labelStyle: LabelStyleType.Type? {
        
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
            
            // get color before applying styles
            let textColor = colorStyle.getColor(colorKey: self.textColorKey)
            
            // apply styles to label
            if let labelStyle = self.labelStyle {
                
                let size = labelStyle.textSizeDic[self.textSizeKey] ?? 100
                
                let font = isBoldFont ? UIFont.boldSystemFontOfSize(size) : UIFont.systemFontOfSize(size)

                Stylizer.stylizeLabel(self, textColor: textColor, font: font)
            }
        }
        
        super.drawRect(rect)
        
    }
}
