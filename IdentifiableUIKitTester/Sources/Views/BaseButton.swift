//
//  BaseButton.swift
//  IdentifiableUIKit
//
//  Created by hanyu on 2016/11/02.
//  Copyright © 2016年 hanyu. All rights reserved.
//

import UIKit

class BaseButton: IdentifiableButton {

    override var buttonStyle: ButtonStyleType.Type? {
        
        return MyButtonStyle.self
    }
    
    override var colorStyle: ColorStyleType.Type? {
        
        return MyColorStyle.self
    }
}
