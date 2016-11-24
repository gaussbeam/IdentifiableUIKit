import UIKit

/// This protocol represents a style of UILabel
/// Following 1 items must be implemented.
/// - static var testSizeDic
public protocol LabelStyleType {

    /// Dictionaries of style
    static var textSizeDic: [String: CGFloat] { get }
    
    /// Keys of dictionaries(ordered by asc)
    static var textSizeKeyList: [String] { get }
}

extension LabelStyleType {

    static var textSizeKeyList: [String] {
        
        var array = Array(self.textSizeDic.keys)
        
        array.sortInPlace(<)
        
        return array
    }
}
