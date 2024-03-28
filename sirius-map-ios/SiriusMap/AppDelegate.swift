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
    private var splashPresenter: SplashPresenterDescription? = SplashPresenter()

    func application(
        _: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow()
        splashPresenter?.present()

        let delay: TimeInterval = 0
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.splashPresenter?.dismiss { [weak self] in
                self?.splashPresenter = nil
                self?.window?.rootViewController = RootNavigationController()
                self?.window?.makeKeyAndVisible()
            }
        }

//        window?.rootViewController = RootNavigationController()
//        window?.makeKeyAndVisible()

        return true
    }
}
