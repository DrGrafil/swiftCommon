//
//  Extensions.swift
//  EDUGrader
//
//  Created by Elliot Grafil on 2/28/16.
//  Copyright © 2016 Elliot Grafil. All rights reserved.
//

// http://www.codingexplorer.com/swiftly-getting-human-readable-date-nsdateformatter/

import Foundation

extension NSDate
{
    
    //MARK: - Convenience Init
    convenience init?(year:Int, month:Int = 1, day:Int = 1, hour:Int = 0, minute:Int = 0, second:Int = 0, nanosecond:Int = 0){
        if let date = NSCalendar.currentCalendar().dateWithEra(1, year:year, month:month, day:day, hour:hour, minute:minute, second:second, nanosecond:nanosecond) {
            self.init(timeIntervalSinceReferenceDate: date.timeIntervalSinceReferenceDate)
        }
        else {
            return nil
        }
    }
    
    convenience init?(hour:Int, minute:Int, second:Int, nanosecond:Int = 0){
        if let date = NSCalendar.currentCalendar().dateWithEra(1, year:2001, month:1, day:1, hour:hour, minute:minute, second:second, nanosecond:nanosecond){
            self.init(timeIntervalSinceReferenceDate: date.timeIntervalSinceReferenceDate)
        }
        else {
            return nil
        }
    }
    
    convenience init?(year:Int, month:Int, day:Int){
        if let date = NSCalendar.currentCalendar().dateWithEra(1, year:year, month:month, day:day, hour:0, minute:0, second:0, nanosecond:0){
            self.init(timeIntervalSinceReferenceDate: date.timeIntervalSinceReferenceDate)
        }
        else {
            return nil
        }
    }
    
    convenience init?( _ year:Int, _ month:Int = 1, _ day:Int = 1, _ hour:Int = 0, _ minute:Int = 0, _ second:Int = 0, _ nanosecond:Int = 0){
        if let date = NSCalendar.currentCalendar().dateWithEra(1, year:year, month:month, day:day, hour:hour, minute:minute, second:second, nanosecond:nanosecond){
            self.init(timeIntervalSinceReferenceDate: date.timeIntervalSinceReferenceDate)
        }
        else {
            return nil
        }
    }
    // MARK: - Date
    func year() -> Int {
        return NSCalendar.currentCalendar().component(.Year, fromDate: self)
    }
    
    func month() -> Int {
        return NSCalendar.currentCalendar().component(.Month, fromDate: self)
    }
    
    func date() -> Int {
        return NSCalendar.currentCalendar().component(.Day, fromDate: self)
    }

    // MARK: - Time
    func hour() -> Int {
        return NSCalendar.currentCalendar().component(.Hour, fromDate: self)
    }
    
    func minute() -> Int {
        return NSCalendar.currentCalendar().component(.Minute, fromDate: self)
    }
    
    func second() -> Int {
        return NSCalendar.currentCalendar().component(.Second, fromDate: self)
    }
    
    
    //MARK: - To String
    
    func toString(dateFormat: NSDateFormatterStyle, timeFormat: NSDateFormatterStyle) -> String {
        let formatter = NSDateFormatter()
        formatter.dateStyle = dateFormat
        formatter.timeStyle = timeFormat
        return formatter.stringFromDate(self)
    }
    
    //MARK: String Date
    // 12/25/14
    func dateStringShortStyle() -> String {
        return self.toString(.ShortStyle, timeFormat: .NoStyle)
    }
    
    // Dec 25, 2014
    func dateStringMediumStyle() -> String {
        return self.toString(.MediumStyle, timeFormat: .NoStyle)
    }
    
    // December 25, 2014
    func dateStringLongStyle() -> String {
        return self.toString(.LongStyle, timeFormat: .NoStyle)
    }
    
    // Thursday, December 25, 2014
    func dateStringFullStyle() -> String {
        return self.toString(.FullStyle, timeFormat: .NoStyle)
    }
    
    //MARK: String Time
    // 7:00 AM
    func timeStringShortStyle() -> String {
        return self.toString(.NoStyle, timeFormat: .ShortStyle)
    }
    
    // 7:00:00 AM
    func timeStringMediumStyle() -> String {
        return self.toString(.NoStyle, timeFormat: .MediumStyle)
    }
    
    // 7:00:00 AM PST
    func timeStringLongStyle() -> String {
        return self.toString(.NoStyle, timeFormat: .LongStyle)
    }
    
    // 7:00:00 AM Pacific Standard Time
    func timeStringFullStyle() -> String {
        return self.toString(.NoStyle, timeFormat: .FullStyle)
    }

    // MARK: -From String
    // Date format from http://userguide.icu-project.org/formatparse/datetime
    convenience init?(date str:String, format:String){
        let formatter = NSDateFormatter()
        formatter.dateFormat = format
        if let date = formatter.dateFromString(str) {
            self.init(timeIntervalSinceReferenceDate: date.timeIntervalSinceReferenceDate)
        }
        else {
            print("Malformed date string:" + str )
            return nil
        }
    }
    
    convenience init?(date str:String, dateFormat: NSDateFormatterStyle, timeFormat: NSDateFormatterStyle){
        let formatter = NSDateFormatter()
        formatter.dateStyle = dateFormat
        formatter.timeStyle = timeFormat
        
        if let date = formatter.dateFromString(str) {
            self.init(timeIntervalSinceReferenceDate: date.timeIntervalSinceReferenceDate)
        }
        else {
            print("Malformed date string:" + str )
            return nil
        }
    }
}

// MARK: - Operators
func ==(left:NSDate, right:NSDate) -> Bool {
     return left.timeIntervalSinceReferenceDate == right.timeIntervalSinceReferenceDate
}

func !=(left:NSDate, right:NSDate) -> Bool {
    return !(left == right)
}

func <(left:NSDate, right:NSDate) -> Bool {
    return left.timeIntervalSinceReferenceDate < right.timeIntervalSinceReferenceDate
}

func >(left:NSDate, right:NSDate) -> Bool {
    return left.timeIntervalSinceReferenceDate > right.timeIntervalSinceReferenceDate
}

func <=(left:NSDate, right:NSDate) -> Bool {
    return left.timeIntervalSinceReferenceDate <= right.timeIntervalSinceReferenceDate
}

func >=(left:NSDate, right:NSDate) -> Bool {
    return left.timeIntervalSinceReferenceDate >= right.timeIntervalSinceReferenceDate
}