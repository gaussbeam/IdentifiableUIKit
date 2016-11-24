//
//  MyViewStyle.swift
//  IdentifiableUIKit
//
//  Created by hanyu on 2016/11/01.
//  Copyright © 2016年 hanyu. All rights reserved.
//

import UIKit

class MyViewStyle: ViewStyleType {
    
    static var shadowStylePropertyDic: [String: ShadowStyleProperty] = [
            "S1": ShadowStyleProperty(opacity: 0.8, offset: CGSize(width: 2.0, height: 2.0), radius: 2.0),
            "S2": ShadowStyleProperty(opacity: 0.15, offset: CGSize(width: 0.0, height: 0.5), radius: 0.0),
        ]
    
    static var roundRectRadiusDic: [String: CGFloat] = [
            "SS": 1.0, // extra small
            "S": 5.0,  // small
            "R": 10.0, // regular
            "L": 30.0  // large
        ]
    
    static var borderWidthDic: [String: CGFloat] = [
            "T": 0.75, // thin
            "R": 2.0,  // regular
            "W": 5.0   // wide
        ]
}
