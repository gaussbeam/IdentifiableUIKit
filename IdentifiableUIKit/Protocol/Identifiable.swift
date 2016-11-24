
import UIKit

/// This protocol represents style of color with `ColorStyleType`
protocol ColorIdentifiable {
    
    /// Class for color style
    var colorStyle: ColorStyleType.Type? { get }
}

/// This protocol represents sytle of UIView with `ViewStyleType`
protocol ViewStyleIdentifiable {
    
    /// Class for view style
    var viewStyle: ViewStyleType.Type? { get }
}

/// This protocol represents style of UILabel with `LabelStyleType`
protocol LabelStyleIdentifiable {
    
    /// Class for label style
    var labelStyle: LabelStyleType.Type? { get }
}

/// This protocol represents style of UIButton with `ButtonStyleType`
protocol ButtonStyleIdentifiable {
    
    /// Class for button style
    var buttonStyle: ButtonStyleType.Type? { get }
}