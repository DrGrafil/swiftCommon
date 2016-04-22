//
//  CalendarEvent.swift
//  EDUGrader
//
//  Created by Elliot Grafil on 3/18/16.
//  Copyright © 2016 Elliot Grafil. All rights reserved.
//

import Foundation
import EventKit

class CalendarEvent: NSCopyableAndCodedObject {
   
    //MARK: Properties
    struct PropertyKey {
        static let inCalendarKey = "inCalendar"
        static let eventIdentifierKey = "eventIdentifier"
        static let titleKey = "title"
        static let startDateKey = "startDate"
        static let endDateKey = "endDate"
        static let notesKey = "notes"
    }
    var inCalendar: Bool        //Is the event in the calendar
    var eventIdentifier:String? //Used to look up event in calendar
    var title: String
    var startDate: NSDate
    var endDate: NSDate
    var notes: String?
    
    //MARK: Init
    init(title:String = "", startDate:NSDate = NSDate(), endDate:NSDate = NSDate(), notes:String? = nil, parent:NSCopyableAndCodedObject? = nil){
        self.inCalendar = false
        self.title = title
        self.startDate = startDate
        self.endDate = endDate
        self.notes = notes
        super.init()
        if let parent = parent{
            self.parentUUID = parent.uuid
        }
    }

    init(event:EKEvent){ // How would you have an EKEvent if it isnt in the calendar
        self.inCalendar = true
        eventIdentifier = event.eventIdentifier
        title = event.title
        startDate = event.startDate
        endDate = event.endDate
        notes = event.notes
        super.init()
    }
    
    // MARK: NSCopy
    required init(copy: AnyObject){
        let object = copy as! CalendarEvent
        inCalendar = object.inCalendar
        eventIdentifier = object.eventIdentifier
        title = object.title
        startDate = object.startDate
        endDate = object.endDate
        notes = object.notes
        super.init(copy:copy)
    }
    
    required init(deepCopy: AnyObject){
        let object = deepCopy as! CalendarEvent
        inCalendar = object.inCalendar
        eventIdentifier = object.eventIdentifier
        title = object.title
        startDate = object.startDate
        endDate = object.endDate
        notes = object.notes
        super.init(deepCopy:deepCopy)
    }
    
    // MARK: NSCoding
    override func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(inCalendar, forKey:  PropertyKey.inCalendarKey)
        aCoder.encodeObject(eventIdentifier, forKey:  PropertyKey.eventIdentifierKey)
        aCoder.encodeObject(title, forKey:  PropertyKey.titleKey)
        aCoder.encodeObject(startDate, forKey:  PropertyKey.startDateKey)
        aCoder.encodeObject(endDate, forKey:  PropertyKey.endDateKey)
        aCoder.encodeObject(notes, forKey:  PropertyKey.notesKey)
        super.encodeWithCoder(aCoder)
    }
    
    required init(coder aDecoder:NSCoder) {
        inCalendar = aDecoder.decodeObjectForKey(PropertyKey.inCalendarKey) as! Bool
        eventIdentifier = aDecoder.decodeObjectForKey(PropertyKey.eventIdentifierKey) as? String
        title = aDecoder.decodeObjectForKey(PropertyKey.titleKey) as! String
        startDate = aDecoder.decodeObjectForKey(PropertyKey.startDateKey) as! NSDate
        endDate = aDecoder.decodeObjectForKey(PropertyKey.endDateKey) as! NSDate
        notes = aDecoder.decodeObjectForKey(PropertyKey.notesKey) as? String
        super.init(coder: aDecoder)
    }
    
}

//MARK: Operators

func !=(left:CalendarEvent, right:CalendarEvent) -> Bool {
    if(left.startDate == right.startDate){
        return left.title != right.title
    }
    else {
        return true
    }
}

func == (left:CalendarEvent, right:CalendarEvent) -> Bool {
    return !(left != right)
}

func < (left:CalendarEvent, right:CalendarEvent) -> Bool {
    if(left.startDate == right.startDate){
        return left.title < right.title
    }
    else {
        return left.startDate < right.startDate
    }
}

func > (left:CalendarEvent, right:CalendarEvent) -> Bool {
    if(left.startDate == right.startDate){
        return left.title > right.title
    }
    else {
        return left.startDate > right.startDate
    }
}

func <= (left:CalendarEvent, right:CalendarEvent) -> Bool {
    return !(left > right)
}

func >= (left:CalendarEvent, right:CalendarEvent) -> Bool {
    return !(left < right)
}


