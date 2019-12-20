//
//  LocationManager.swift
//  Swift-Sample-SignificantChangeLocationService
//
//  Created by nobuy on 2019/12/20.
//  Copyright © 2019 A10 Lab Inc. All rights reserved.
//

import CoreLocation

protocol LocationManagerDelegate: AnyObject {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
}

class LocationManager: NSObject {
    static let shared = LocationManager()

    weak var delegate: LocationManagerDelegate?
    private let locationManager = CLLocationManager()
    private override init() {
        super.init()
        locationManager.delegate = self
        locationManager.activityType = .fitness
    }

    func requestAlwaysAuthorization() {
        locationManager.requestAlwaysAuthorization()
    }

    func startMonitoringSignificantLocationChanges() {
        locationManager.startMonitoringSignificantLocationChanges()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        delegate?.locationManager(manager, didUpdateLocations: locations)
    }
}
