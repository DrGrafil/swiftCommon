//
//  Email.swift
//  EDUGrader
//
//  Created by Elliot Grafil on 2/26/16.
//  Copyright © 2016 Elliot Grafil. All rights reserved.
//

import Foundation

struct  Email{
    
    var isHTML: Bool
    
    var from: String?
    var to: [String]?
    var cc: [String]?
    var bcc: [String]?
    
    var subject: String
    var body: String
    
    var files: [File] = [File]()
    
    init(   from:String? = nil,
            to:[String]? = nil,
            cc:[String]? = nil,
            bcc:[String]? = nil,
            subject:String = "",
            body:String = "",
            isHTML: Bool = false,
            files:[File] = []
        ){
            self.from = from
            self.to = to
            self.cc = cc
            self.bcc = bcc
            self.subject = subject
            self.body = body
            self.isHTML = isHTML
            self.files = files
    }
    
    mutating func addFile(file:File) {
        files.append(file)
    }
}