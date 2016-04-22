//
//  ApplicationActions.swift
//  EduChoice
//
//  Created by Elliot Grafil on 2/2/16.
//  Copyright © 2016 Elliot Grafil. All rights reserved.
//

//Access outside applications

import UIKit


func applicationCallPhoneNumber(number: String) {
    var phoneNumber = ""
    
    for charecters in number.characters {
        
        switch(charecters){
        case "0","1","2","3","4","5","6","7","8","9" :  phoneNumber += String(charecters)
        default: break
        }
    }
    print(phoneNumber)
    
    if  (!phoneNumber.isEmpty){
        
        UIApplication.sharedApplication().openURL(NSURL(string: "tel://" + phoneNumber)!)
    }
}

func applicationVisitWebsite(url: String) {
    var websiteURL = ""
    
    if !url.containsString("http://") && !url.containsString("https://") {
        websiteURL += "http://"
    }
    /*
    for charecters in url.characters {
    
    switch(charecters){
    case "0","1","2","3","4","5","6","7","8","9" :  phoneNumber += String(charecters)
    default: break
    }
    }
    print(phoneNumber)
    */
    websiteURL += url
    if  (!websiteURL.isEmpty){
        UIApplication.sharedApplication().openURL(NSURL(string: websiteURL)!)
    }
}