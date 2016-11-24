//
//  BaseLabel.swift
//  IdentifiableUIKit
//
//  Created by hanyu on 2016/11/01.
//  Copyright © 2016年 hanyu. All rights reserved.
//

import UIKit

class BaseLabel: IdentifiableLabel {

    override var colorStyle: ColorStyleType.Type? {
        
        return MyColorStyle.self
    }

    override var labelStyle: LabelStyleType.Type? {
        
        return MyLabelStyle.self
    }
}
