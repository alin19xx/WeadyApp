//
//  LocationManager.swift
//  WeadyApp
//
//  Created by Alex Lin on 8/11/22.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject {
    private let manager = CLLocationManager()
    @Published var userLocation: CLLocation?
    static let shared = LocationManager()
    
    override init() {
        super.init()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
    }
    
    func requestLocation() {
        manager.requestWhenInUseAuthorization()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .notDetermined:
            print("NOT DETERMINED")
        case .restricted:
            print("RESTRICTED")
        case .denied:
            print("DENIED")
        case .authorizedAlways:
            print("ALWAYS")
        case .authorizedWhenInUse:
            print("IN USE")
        @unknown default:
            print("UNKNOWN")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        self.userLocation = location
        debugPrint("longitude: \(userLocation?.coordinate.longitude)")
        debugPrint("latitude: \(userLocation?.coordinate.latitude)")
    }
}
