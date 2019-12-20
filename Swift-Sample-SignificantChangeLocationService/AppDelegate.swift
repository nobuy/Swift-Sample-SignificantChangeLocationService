//
//  AppDelegate.swift
//  Swift-Sample-SignificantChangeLocationService
//
//  Created by nobuy on 2019/12/20.
//  Copyright © 2019 A10 Lab Inc. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private let userDefaults = UserDefaults.standard

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        if launchOptions?[UIApplication.LaunchOptionsKey.location] != nil {
            LocationManager.shared.startMonitoringSignificantLocationChanges()
        }
        userDefaults.register(defaults: ["Log": "date"])

        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = UIColor.red
        UINavigationBar.appearance().tintColor = UIColor.white

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: ViewController())
        window?.makeKeyAndVisible()
        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        print("DidEnterBackground")
        if CLLocationManager.significantLocationChangeMonitoringAvailable() {
            print("startMonitoringSignificantLocationChanges")
            LocationManager.shared.startMonitoringSignificantLocationChanges()
        }
    }
}

