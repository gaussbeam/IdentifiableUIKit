import UIKit


/// This protocol represents a style of color
/// Following 1 items must be implemented.
/// - static var colorDic
public protocol ColorStyleType {

    /// Dictionary of style
    static var colorDic: [String: UIColor] { get }
    
    /// Keys of dictionaries(ordered by asc)
    static var colorKeyList: [String] { get }
    
    /// - returns: UIColor equivalent for key or UIColor.clearColor()
    static func getColor(colorKey key: String) -> UIColor
}

extension ColorStyleType {
        
    static var colorKeyList: [String] {
        
        var array = Array(self.colorDic.keys)
        
        array.sortInPlace(<)
        
        return array
    }
    
    static func getColor(colorKey key: String) -> UIColor {
        
        return Self.colorDic[key] ?? UIColor.clearColor()
    }
}
