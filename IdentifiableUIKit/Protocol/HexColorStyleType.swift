import UIKit

/// This protocol represents a style of color by color code(HEX)
/// Following 1 items must be implemented.
/// - static var hexColorDic
protocol HexColorStyleType: ColorStyleType {

    /// Dictionary of style
    static var hexColorDic: [String: String] { get }
}

extension HexColorStyleType {
    
    /// generate dictionary of color from dictionary of color code
    static var colorDic: [String: UIColor] {
        
        let tmpColorDic = hexColorDic.reduce([String: UIColor]()) { (tmpColorDic, codeDic) in
            
            let color = Self.colorFromColorCode(codeDic.1)
            
            var dic = tmpColorDic
            dic[codeDic.0] = color
            
            return dic
        }
        
        return tmpColorDic
    }

    /// generate color by color code
    private static func colorFromColorCode(colorCode: String) -> UIColor {
        
        let scanner = NSScanner(string: colorCode)
        var color = CUnsignedInt()
        
        scanner.scanHexInt(&color)
        
        return UIColor(
            red: CGFloat((color & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((color & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(color & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
