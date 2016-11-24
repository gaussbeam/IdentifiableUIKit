# IdentifiableUIKit


## Usage

### Define style
* Add `IdentifiableUIKit` to your project.
* Create classes adapt `StyleType` protocols listed below
  * `ButtonStyleType`
	* `ColorStyleType`
	* `LabelStyleType`
	* `ViewStyleType`  

```
class MyColorStyle: NSObject, ColorStyleType {
    
    static var colorDic: [String : UIColor] = [
        
			"C01": UIColor.redColor
		]
}
```

* Create classes as a subclass of `IdentifiableView` or some classes listed below
	* `IdentifiableButton`
	* `IdentifiableCollectionViewCell`
	* `IdentifiableLabel`
	* `IdentifiableView`
* Set variables of subclass of `IdentifiableView` to classes adapt `StyleType`

```
class MyView: IdentifiableView {
	overridevar colorStyle: ColorStyleType.Type? {
		returnMyColorStyle.self
	}
}
```

### Apply style in Interface Builder by ID
* Add some view (or button, label, …) in Interface Builder
* Set custom class of view to subclass of `IdentifiableView` in Identity Inspector
* Set background color to Clear Color (to work properly)
* Input IDs of style in Attribute Inspector


## TO DO's

* Add `IdentifiableTableViewCell`, `IdentifiableTextView`, `IdentifiableTextField`, and so on.


## Environment

* Xcode Version 7.3.1 (7D1014)
* Apple Swift version 2.2 (swiftlang-703.0.18.8 clang-703.0.31)


## Feedback

Please give me your feedback to gaussbeam@gmail.com.
