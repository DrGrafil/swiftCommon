//
//  PhoneUITextField.swift
//  EDUGrader
//
//  Created by Elliot Grafil on 3/30/16.
//  Copyright © 2016 Elliot Grafil. All rights reserved.
//

import UIKit

class PhoneUITextField: UITextField {

    convenience init() {
        self.init(frame:CGRectZero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.keyboardType = .NumberPad;
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        self.keyboardType = .NumberPad;
    }
}
