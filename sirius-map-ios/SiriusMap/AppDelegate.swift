//
//  AppDelegate.swift
//  SiriusMap
//
//  Created by Sergey Abrosov on 20.03.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow()
        window?.rootViewController = RootNavigationController()
        window?.makeKeyAndVisible()

        return true
    }
}
