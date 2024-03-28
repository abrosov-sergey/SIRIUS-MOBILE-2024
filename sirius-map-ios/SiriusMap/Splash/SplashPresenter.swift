//
//  SplashPresenter.swift
//  SiriusMap
//
//  Created by Sergey Abrosov on 28.03.2024.
//

import UIKit

protocol SplashPresenterDescription: AnyObject {
    func present()
    func dismiss(completion: @escaping () -> Void)
}

final class SplashPresenter: SplashPresenterDescription {
    // MARK: - Properties

    private lazy var animator: SplashAnimatorDescription = SplashAnimator(foregroundSplashWindow: foregroundSplashWindow,
                                                                          backgroundSplashWindow: backgroundSplashWindow)

    private lazy var foregroundSplashWindow: UIWindow = {
        let splashViewController = self.splashViewController(with: textImage, logoIsHidden: false)
        let splashWindow = self.splashWindow(windowLevel: .normal + 1, rootViewController: splashViewController)

        return splashWindow
    }()

    private lazy var backgroundSplashWindow: UIWindow = {
        let splashViewController = self.splashViewController(with: textImage, logoIsHidden: true)
        let splashWindow = self.splashWindow(windowLevel: .normal - 1, rootViewController: splashViewController)

        return splashWindow
    }()

    private lazy var textImage: UIImage? = {
        let textsCount = 17

        let imageNumber = Int.random(in: 1 ... textsCount)
        let imageName = "i-splash-text-\(imageNumber)"

        return UIImage(named: imageName)
    }()

    // MARK: - Helpers

    private func splashWindow(windowLevel: UIWindow.Level, rootViewController: SplashViewController?) -> UIWindow {
        let splashWindow = UIWindow(frame: UIScreen.main.bounds)

        splashWindow.windowLevel = windowLevel
        splashWindow.rootViewController = rootViewController

        return splashWindow
    }

    private func splashViewController(with textImage: UIImage?, logoIsHidden: Bool) -> SplashViewController? {
//        let storyboard = UIStoryboard(name: nil, bundle: nil)
//        let viewController = storyboard.instantiateViewController(withIdentifier: "SplashViewController")
//        let splashViewController = viewController as? SplashViewController
        let splashViewController = SplashViewController()

        splashViewController.textImage = textImage
        splashViewController.logoIsHidden = logoIsHidden

        return splashViewController
    }

    // MARK: - SplashPresenterDescription

    func present() {
        animator.animateAppearance()
    }

    func dismiss(completion: @escaping () -> Void) {
        animator.animateDisappearance(completion: completion)
    }
}
