//
//  BaseView.swift
//  IdentifiableUIKit
//
//  Created by hanyu on 2016/11/01.
//  Copyright © 2016 hanyu. All rights reserved.
//

import UIKit

class BaseView: IdentifiableView {

    override var viewStyle: ViewStyleType.Type? {
        
        return MyViewStyle.self
    }
    
    override var colorStyle: ColorStyleType.Type? {
        
        return MyColorStyle.self
    }
}
