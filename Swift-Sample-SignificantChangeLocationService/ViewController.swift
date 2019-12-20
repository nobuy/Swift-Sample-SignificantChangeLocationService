//
//  ViewController.swift
//  Swift-Sample-SignificantChangeLocationService
//
//  Created by nobuy on 2019/12/20.
//  Copyright © 2019 A10 Lab Inc. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    private let userDefaults = UserDefaults.standard
    private let locationManager = LocationManager.shared
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.backgroundColor = .black
        label.numberOfLines = 0
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        label.text = userDefaults.object(forKey: "Log") as? String

        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
    }
}

// MARK: CLLocationManagerDelegate
extension ViewController: LocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        let locationInfo = "\(location.timestamp) \(location.coordinate.latitude) \(location.coordinate.longitude)"
        let rec = userDefaults.object(forKey: "Log") as! String + "\n" + locationInfo
        userDefaults.set(rec , forKey: "Log")
        userDefaults.synchronize()
        print(rec)
        label.text = rec
    }
}
