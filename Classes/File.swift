//
//  File.swift
//  EDUGrader
//
//  Created by Elliot Grafil on 2/26/16.
//  Copyright © 2016 Elliot Grafil. All rights reserved.
//

import Foundation

struct File {
    var fileName: String
    var swiftFileName: String {
            return String(fileName.characters.split(".").first!)
    }
    var directory: String?
    var mimeType: String
    
    var ext: String {
        return String(fileName.characters.split(".").last!)
    }
    
    var filePath: String? {
        get{
            if directory != nil {
                return NSBundle.mainBundle().pathForResource( swiftFileName, ofType: ext, inDirectory: directory)
            }
            else {
                return NSBundle.mainBundle().pathForResource( swiftFileName, ofType: ext)
            }
        }
    }
    
    var data: NSData? {
        get{
            if filePath != nil {
                return NSData(contentsOfFile: filePath!)
            }
            else
            {
                return nil
            }
    
        }
    }
    
    init(fileName: String, mimeType:String, directory:String?) {
        self.fileName = fileName
        self.mimeType = mimeType
        self.directory = directory
    }
    
    init?(fileName: String, directory:String?){
        self.fileName = fileName
        self.mimeType = ""
        self.directory = directory
        
        if let type = deduceMimeType(fileName){
            self.mimeType = type
        }
        else{
            return nil
        }
    }
    
    func deduceMimeType( fileName:String ) ->String?{

        let extstr = String(fileName.characters.split(".").last!)
        
        switch(extstr.lowercaseString){
            case "pdf":
                return "application/pdf"
            case "csv":
                return "text/csv"
            case "json":
                return "application/json"
            case "xls":
                return "application/vnd.ms-excel"
            case "wav":
                return "audio/wav"
            default:
                return nil
        }
    }
}