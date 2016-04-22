//
//  Copyable.swift
//  EDUGrader
//
//  Created by Elliot Grafil on 3/15/16.
//  Copyright © 2016 Elliot Grafil. All rights reserved.
//

import Foundation

public protocol Copyable: NSCopying, NSMutableCopying {
    init(copy: AnyObject)
    init(deepCopy: AnyObject)
}