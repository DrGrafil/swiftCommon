//
//  Dictionary.swift
//  EDUGrader
//
//  Created by Elliot Grafil on 3/3/16.
//  Copyright © 2016 Elliot Grafil. All rights reserved.
//

import Foundation

// http://stackoverflow.com/questions/24640990/how-do-i-get-the-key-at-a-specific-index-from-a-dictionary-in-swift

extension Dictionary {
    subscript(i:Int) -> (key:Key,value:Value) {
        get {
            return self[self.startIndex.advancedBy(i)]
        }
    }
}