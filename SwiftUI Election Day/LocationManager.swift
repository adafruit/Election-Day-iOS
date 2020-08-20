//
//  LocationManager.swift
//  SwiftUI Election Day
//
//  Created by Trevor Beaton on 8/11/20.
//

import Foundation
import MapKit
import CoreLocation

class LocationManager : NSObject, ObservableObject {
   
    private let locationManager = CLLocationManager()
    
    @Published var location : CLLocation? = nil
    
    public var exposedLocation: CLLocation? {
            return self.locationManager.location
        }
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
    }
    
}
 

extension LocationManager : CLLocationManagerDelegate {
   
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last else {
            return
        }
        self.location = location
    }
    
    
    func locationManager(_ manager: CLLocationManager,
                            didChangeAuthorization status: CLAuthorizationStatus) {

           switch status {
       
           case .notDetermined         : print("notDetermined")        // location permission not asked for yet
           case .authorizedWhenInUse   : print("authorizedWhenInUse")  // location authorized
           case .authorizedAlways      : print("authorizedAlways")     // location authorized
           case .restricted            : print("restricted")           // TODO: handle
           case .denied                : print("denied")               // TODO: handle
           }
       }
}

extension LocationManager {
    
    
    func getPlace(for location: CLLocation,
                  completion: @escaping (CLPlacemark?) -> Void) {
        
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            
            guard error == nil else {
                print("*** Error in \(#function): \(error!.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let placemark = placemarks?[0] else {
                print("*** Error in \(#function): placemark is nil")
                completion(nil)
                return
            }
            
            completion(placemark)
        }
    }
}
