//
//  BaseCollectionViewCell.swift
//  IdentifiableUIKit
//
//  Created by hanyu on 2016/11/02.
//  Copyright © 2016年 gaussbeam. All rights reserved.
//

import UIKit

class BaseCollectionViewCell: IdentifiableCollectionViewCell {

    override var viewStyle: ViewStyleType.Type? {
        
        return MyViewStyle.self
    }
    
    override var colorStyle: ColorStyleType.Type? {
        
        return MyColorStyle.self
    }
}
