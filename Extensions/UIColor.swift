//
//  UIColor.swift
//  EDUGrader
//
//  Created by Elliot Grafil on 2/19/16.
//  Copyright © 2016 Elliot Grafil. All rights reserved.
//

import UIKit

extension UIColor
{
    convenience init(red: Int, green: Int, blue: Int)
    {
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
    
    public class func gradebookSheetR1Color() -> UIColor {
        return UIColor(red: 63, green: 255, blue: 0)
    }
    
    public class func gradebookSheetR2Color() -> UIColor {
        
        return UIColor(red: 0, green: 255, blue: 0)
    }
}