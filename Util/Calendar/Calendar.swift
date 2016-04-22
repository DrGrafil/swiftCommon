//
//  Calendar.swift
//  EDUGrader
//
//  Created by Elliot Grafil on 3/18/16.
//  Copyright © 2016 Elliot Grafil. All rights reserved.
//

//https://forums.developer.apple.com/thread/4749
//http://stackoverflow.com/questions/246249/programmatically-add-custom-event-in-the-iphone-calendar
//http://www.appcoda.com/ios-event-kit-programming-tutorial/
//https://www.raywenderlich.com/64513/cookbook-making-calendar-reminder !!
import Foundation
import UIKit
import EventKit

class Calendar {
    var name:String
    var calendar: EKCalendar?
    let eventStore: EKEventStore = EKEventStore() // The database with calendar events and reminders
    
    init(name:String){
        self.name = name
        if( checkAuthorization() ){
            loadCalendar()
        }
        
    }
    
    // MARK: Calendar Manipulation
    func getEvent(event e:CalendarEvent) -> EKEvent? {
        if let str = e.eventIdentifier {
            return eventStore.eventWithIdentifier(str)
        }
        else {
            return nil
        }
    }
    
    func addEvent(event e:CalendarEvent) -> Bool {
        if(checkAuthorization()) {
            loadCalendar()
            
            let event:EKEvent = EKEvent(eventStore: eventStore)
            event.title = e.title
            event.startDate = e.startDate
            event.endDate = e.endDate
            event.notes = e.notes
            event.calendar = calendar!
            
            do{
                try eventStore.saveEvent(event, span: EKSpan.ThisEvent)
                print("Event Stored")
                e.eventIdentifier = event.eventIdentifier
                e.inCalendar = true
                saveCalendar()
                return true
                
            } catch let error as NSError {
                print("addEvent Failed: " + error.localizedDescription)
                return false
            }
        }
        else { //Authorization has failed
            return false
        }
    }
    
    
    func editEvent(event e:CalendarEvent) -> Bool {
        if(checkAuthorization()) {
            loadCalendar()
            
            if let event:EKEvent = self.getEvent(event: e) {
                event.title = e.title
                event.startDate = e.startDate
                event.endDate = e.endDate
                event.notes = e.notes
                
                //Delete old
                self.deleteEvent(event: e)
                //Add it back
                do{
                    try eventStore.saveEvent(event, span: EKSpan.ThisEvent)
                    e.eventIdentifier = event.eventIdentifier
                    saveCalendar()
                    return true
                } catch let error as NSError {
                    print("editEvent Failed: " + error.localizedDescription)
                    return false
                }
            } else { // Event we thought exists doesnt exist so it need to add it
                if(self.addEvent(event:e)){
                    saveCalendar()
                    return true
                } else {
                    return false
                }
            }
        }
        else { //Authorization has failed
            return false
        }
    }

    
    func deleteEvent(event e:CalendarEvent) -> Bool {
        if(checkAuthorization()) {
            loadCalendar()
            
            if let event = getEvent(event:e){
                do{
                    try eventStore.removeEvent(event, span: .ThisEvent)
                    e.inCalendar = false
                    return true
                }catch let error as NSError{
                    print( "deleteEvent Failed: " + error.localizedDescription)
                    return false
                }
            } else { //Not in calendar
                e.inCalendar = false
                return false
            }
        }
        else { //Authorization has failed
            return false
        }
    }
    
    func updateEventFromCalendar(event e:CalendarEvent){
        if let event = getEvent(event:e) {
            e.inCalendar = true
            e.title = event.title
            e.startDate = event.startDate
            e.endDate = event.endDate
            e.notes = event.notes
        } else { // not in Calendar
            e.inCalendar = false
        }
    }
    
    
    
    func checkAuthorization() ->Bool {
        let status = EKEventStore.authorizationStatusForEntityType(EKEntityType.Event)
        
        switch (status) {
        case EKAuthorizationStatus.NotDetermined:
            // This happens on first-run
            return requestAccess()
        case EKAuthorizationStatus.Authorized:
            // Things are in line with being able to show the calendars in the table view
            return true
        case EKAuthorizationStatus.Restricted, EKAuthorizationStatus.Denied:
            // We need to help them give us permission
            return false
        }
    }
    
    func requestAccess() ->Bool {
        var access: Bool = false
        
        eventStore.requestAccessToEntityType(EKEntityType.Event, completion: {
            (accessGranted: Bool, error: NSError?) in
            access = accessGranted
        })
        return access
    }
    
    // Called only after we have assured that we have been granted access
    private func loadCalendar(){
        if calendar == nil {
            let cloudCalendars = eventStore.calendarsForEntityType(EKEntityType.Event) // Grab every calendar the user has
            var exists: Bool = false
            for calendar in cloudCalendars { // Search all these calendars
                if calendar.title == self.name {
                    exists = true
                    self.calendar = calendar
                }
            }
        
            if !exists {
                let newCalendar = EKCalendar(forEntityType:EKEntityType.Event, eventStore:eventStore)
                newCalendar.title=self.name
                newCalendar.source = eventStore.defaultCalendarForNewEvents.source
                do{
                    try eventStore.saveCalendar(newCalendar, commit:true)
                }catch let error as NSError{
                    print("loadCalendar Failed: " + error.localizedDescription)
                }
                self.calendar = newCalendar
            }
        }
    }

    private func saveCalendar() {
        // Filter the available sources and select the "Local" source to assign to the new calendar's
        // source property
        do{
            try eventStore.saveCalendar(calendar!, commit: true)
            NSUserDefaults.standardUserDefaults().setObject(calendar!.calendarIdentifier, forKey: "EventTrackerPrimaryCalendar")
        }catch let error as NSError{ // Handle situation if the calendar could not be saved
       /* let alert = UIAlertController(title: "Calendar could not save", message: "", preferredStyle: .Alert)
        let OKAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(OKAction)
    
        viewController.presentViewController(alert, animated: true, completion: nil)*/
            print("saveCalendar Failed: " + error.localizedDescription)
        }
    }
    
    func test() {
        print("Test1")
        let testEvent = CalendarEvent(title: "This is a test", notes: "YAY!")
        let testCalendar = Calendar(name: "TestCalendar")
        print(testCalendar.checkAuthorization())
        testCalendar.addEvent(event: testEvent)
        print("Test2")
        let testEvent2 = CalendarEvent(title: "This is a 2nd test", notes: "YAY!")
        testCalendar.addEvent(event: testEvent2)
        testEvent2.title = "The 2nd test succeded"
        testCalendar.editEvent(event: testEvent2)
        print("Test3")
        let testEvent3 = CalendarEvent(title: "This is a 3rd test", notes: "YAY!")
        testCalendar.addEvent(event: testEvent3)
        testCalendar.deleteEvent(event: testEvent3)
    }
}