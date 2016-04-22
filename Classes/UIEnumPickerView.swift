//
//  UIEnumPickerView.swift
//  EDUGrader
//
//  Created by Elliot Grafil on 3/15/16.
//  Copyright © 2016 Elliot Grafil. All rights reserved.
//

import UIKit


//https://www.raywenderlich.com/76433/how-to-make-a-custom-control-swift
//https://gist.github.com/LoganWright/5785b62fd30cd6c96e45
class UIEnumPickerView< T: protocol<EnumProtocols> >: UIControl, UIPickerViewDataSource, UIPickerViewDelegate  {

    var value: T
    var text: String { return value.description }
    
    let pickerView:UIPickerView = UIPickerView()
// MARK: - UIPickerViewDataSource
    convenience init() {
        self.init(frame: CGRectZero)
    }
    

    override init(frame: CGRect) {
        value = T(rawValue: 0)!
        super.init(frame: frame)
        
        pickerView.dataSource = self
        pickerView.delegate = self
        self.addSubview(pickerView)
    }
    
func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
    return 1
}

func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return T.allValues.count
}

// MARK: - UIPickerViewDelegate

func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return T(rawValue: row)!.description
}

func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    value = T(rawValue: row)!
}
// several optional methods:

// func pickerView(pickerView: UIPickerView!, widthForComponent component: Int) -> CGFloat

// func pickerView(pickerView: UIPickerView!, rowHeightForComponent component: Int) -> CGFloat

// func pickerView(pickerView: UIPickerView!, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString!

// func pickerView(pickerView: UIPickerView!, viewForRow row: Int, forComponent component: Int, reusingView view: UIView!) -> UIView!



}
