//
//  EnumPrintable.swift
//  EDUGrader
//
//  Created by Elliot Grafil on 3/15/16.
//  Copyright © 2016 Elliot Grafil. All rights reserved.
//

import Foundation

public protocol EnumPrintable {
    var description: String { get }
}

public protocol EnumPrintableInit {
    init?(description:String)
}

public protocol EnumCount{
    associatedtype Enum
    static var allValues:[Enum] { get }
}

//Needed when constructing Generics that uses enum rawValue init.
public protocol EnumInit {
    init?(rawValue:Int)
}

public protocol EnumProtocols: EnumPrintable, EnumPrintableInit, EnumCount, EnumInit {
    
}