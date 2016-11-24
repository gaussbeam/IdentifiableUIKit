//
//  ViewController.swift
//  IdentifiableUIKit
//
//  Created by hanyu on 2016/11/22.
//  Copyright © 2016 hanyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    private let TAG_MY_LABEL_PARAM_PICKER = 10000
    private let TAG_MY_VIEW_PARAM_PICKER  = 20000
    private let TAG_MY_BUTTON_PARAM_PICKER = 30000
    
    private let textSizeKeyList = MyLabelStyle.textSizeKeyList
    
    @IBOutlet weak var myLabel: BaseLabel!
    @IBOutlet weak var myLabelParamPicker: UIPickerView!
    @IBOutlet weak var myView: BaseView!
    @IBOutlet weak var myViewParamPicker: UIPickerView!
    @IBOutlet weak var myButton: BaseButton!
    @IBOutlet weak var myButtonParamPicker: UIPickerView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.myLabelParamPicker.dataSource = self
        self.myLabelParamPicker.delegate = self
        self.myLabelParamPicker.tag = TAG_MY_LABEL_PARAM_PICKER
        
        self.myViewParamPicker.dataSource = self
        self.myViewParamPicker.delegate = self
        self.myViewParamPicker.tag = TAG_MY_VIEW_PARAM_PICKER

        self.myButtonParamPicker.dataSource = self
        self.myButtonParamPicker.delegate = self
        self.myButtonParamPicker.tag = TAG_MY_BUTTON_PARAM_PICKER
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        switch pickerView.tag {
            
            case TAG_MY_LABEL_PARAM_PICKER:
                return 3
            case TAG_MY_VIEW_PARAM_PICKER:
                return 7
            case TAG_MY_BUTTON_PARAM_PICKER:
                return 9
            default:
                return 0
        }
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if let viewStyle = myView.viewStyle, colorStyle = myView.colorStyle {
            
            let colorKeyList           = colorStyle.colorKeyList
            let shadowStyleKeyList     = viewStyle.shadowStyleKeyList
            let roundRectRadiusKeyList = viewStyle.roundRectRadiusKeyList
            let borderWidthTypeKeyList = viewStyle.borderWidthKeyList
            
            if pickerView.tag == TAG_MY_LABEL_PARAM_PICKER {
                
                switch component {
                    
                case 0:
                    return textSizeKeyList.count
                case 1:
                    return 2
                case 2:
                    return colorKeyList.count
                default:
                    break
                }
            } else if pickerView.tag == TAG_MY_VIEW_PARAM_PICKER {
                
                switch component {
                    
                case 0:
                    return colorKeyList.count
                case 1:
                    return 2 // true or false
                case 2:
                    return roundRectRadiusKeyList.count
                case 3:
                    return shadowStyleKeyList.count
                case 4:
                    return colorKeyList.count
                case 5:
                    return borderWidthTypeKeyList.count
                case 6:
                    return colorKeyList.count
                default:
                    break
                }
            } else if pickerView.tag == TAG_MY_BUTTON_PARAM_PICKER {
                
                switch component {
                case 0, 1, 2:
                    return colorKeyList.count
                case 3:
                    return 2
                case 4:
                    return roundRectRadiusKeyList.count
                case 5:
                    return borderWidthTypeKeyList.count
                case 6:
                    return colorKeyList.count
                case 7:
                    return textSizeKeyList.count
                case 8:
                    return 2
                default:
                    break
                }
            }
        }
        
        return 0
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if let viewStyle = myView.viewStyle, colorStyle = myView.colorStyle {
            
            let colorKeyList           = colorStyle.colorKeyList
            let shadowStyleKeyList     = viewStyle.shadowStyleKeyList
            let roundRectRadiusKeyList = viewStyle.roundRectRadiusKeyList
            let borderWidthTypeKeyList = viewStyle.borderWidthKeyList
            
            if pickerView.tag == TAG_MY_LABEL_PARAM_PICKER {
                switch component {
                case 0:
                    return textSizeKeyList[row]
                case 1:
                    return (row == 0) ? "R" : "B"
                case 2:
                    return colorKeyList[row]
                default:
                    break
                }
            } else if pickerView.tag == TAG_MY_VIEW_PARAM_PICKER {
                switch component {
                case 0:
                    return colorKeyList[row]
                case 1:
                    return (row == 0) ? "T" : "F"
                case 2:
                    return roundRectRadiusKeyList[row]
                case 3:
                    return shadowStyleKeyList[row]
                case 4:
                    return colorKeyList[row]
                case 5:
                    return borderWidthTypeKeyList[row]
                case 6:
                    return colorKeyList[row]
                default:
                    break
                }
            } else if pickerView.tag == TAG_MY_BUTTON_PARAM_PICKER {
                
                switch component {
                case 0, 1, 2:
                    return colorKeyList[row]
                case 3:
                    return (row == 0) ? "T" : "F"
                case 4:
                    return roundRectRadiusKeyList[row]
                case 5:
                    return borderWidthTypeKeyList[row]
                case 6:
                    return colorKeyList[row]
                case 7:
                    return textSizeKeyList[row]
                case 8:
                    return (row == 0) ? "R" : "B"
                default:
                    break
                }
            }
        }
        
        return ""
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if let viewStyle = myView.viewStyle, colorStyle = myView.colorStyle {
            
            let colorKeyList           = colorStyle.colorKeyList
            let shadowStyleKeyList     = viewStyle.shadowStyleKeyList
            let roundRectRadiusKeyList = viewStyle.roundRectRadiusKeyList
            let borderWidthTypeKeyList = viewStyle.borderWidthKeyList
            
            if pickerView.tag == TAG_MY_LABEL_PARAM_PICKER {
                switch component {
                case 0:
                    
                    self.myLabel.textSizeKey = (myLabel.labelStyle?.textSizeKeyList[row])!
                case 1:
                    self.myLabel.isBoldFont = (row == 1)
                case 2:
                    self.myLabel.textColorKey = colorKeyList[row]
                default:
                    break
                }
                
                self.myLabel.setNeedsDisplay()
            } else if pickerView.tag == TAG_MY_VIEW_PARAM_PICKER {
                switch component {
                case 0:
                    self.myView.backgroundColorKey = colorKeyList[row]
                case 1:
                    self.myView.isHalfCircle = (row == 0)
                case 2:
                    self.myView.roundRectTypeKey = roundRectRadiusKeyList[row]
                case 3:
                    self.myView.shadowStyleKey = shadowStyleKeyList[row]
                case 4:
                    self.myView.shadowColorKey = colorKeyList[row]
                case 5:
                    self.myView.borderWidthKey = borderWidthTypeKeyList[row]
                case 6:
                    self.myView.borderColorKey = colorKeyList[row]
                default:
                    break
                }
                
                self.myView.setNeedsDisplay()

            } else if pickerView.tag == TAG_MY_BUTTON_PARAM_PICKER {
                
                switch component {
                case 0:
                    self.myButton.tintColorKey = colorKeyList[row]
                case 1:
                    self.myButton.normalBgColorKey = colorKeyList[row]
                case 2:
                    self.myButton.highlightBgColorKey = colorKeyList[row]
                case 3:
                    self.myButton.isHalfCircle = (row == 0)
                case 4:
                    self.myButton.roundRectTypeKey = roundRectRadiusKeyList[row]
                case 5:
                    self.myButton.borderWidthKey = borderWidthTypeKeyList[row]
                case 6:
                    self.myButton.borderColorKey = colorKeyList[row]
                case 7:
                    self.myButton.textSizeKey = textSizeKeyList[row]
                case 8:
                    self.myButton.isBoldFont = (row == 1)
                default:
                    break
                }

                self.myButton.setNeedsDisplay()
            } else {
                // do nothing
            }
            
        }
    }
}
