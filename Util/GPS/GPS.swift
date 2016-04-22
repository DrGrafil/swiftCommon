//
//  GPS.swift
//  EduChoice
//
//  Created by Elliot Grafil on 2/1/16.
//  Copyright © 2016 Elliot Grafil. All rights reserved.
//

import UIKit
import CoreLocation

//Singleton
class GPS: NSObject, UIApplicationDelegate, CLLocationManagerDelegate {
    
    // MARK: Properties
    var locationManager: CLLocationManager = CLLocationManager()
    var location: CLLocation = CLLocation(latitude: 21.282778, longitude: -157.829444) // Honolulu

    // MARK: Functions
    func startGPS() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        startUpdating()
    }
    
    func startUpdating(){
        locationManager.startUpdatingLocation()
    }
    
    func stopUpdating(){
        locationManager.stopUpdatingLocation()
    }
    
    func singleUpdate(){
       // locationManager.requestLocation()
    }

    
    func GetAddress(){
        
    }
    
    // Overloading returns
    func getLocation() -> CLLocation {
        return location;
    }
    
    
    // MARK: CLLocationManagerDelegate Classes
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Error while updating location " + error.localizedDescription)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        if isValidLocation(locations[0], oldlocation: location){
            location = locations[0]
        }
    }

    // MARK: Location Validator
    private func isValidLocation(location: CLLocation?, oldlocation: CLLocation?) ->Bool {
        // filters nil
        if (location == nil) {
            return false
        }
        
        // filter accuracy
        if ( location!.horizontalAccuracy < 0 )
        {
            return false
        }
        
        // if comparing to old location
        if (oldlocation != nil) {
            let secoundsSinceLastPoint : NSTimeInterval = location!.timestamp.timeIntervalSinceDate(oldlocation!.timestamp)
            // filters out of order
            if secoundsSinceLastPoint < 0 {
                return false
            }
        }
        return true
    }
    
    // MARK: Singleton
    static let sharedInstance = GPS()
    private override init() { super.init()} //This prevents others from using the default '()' initializer for this class.
}
