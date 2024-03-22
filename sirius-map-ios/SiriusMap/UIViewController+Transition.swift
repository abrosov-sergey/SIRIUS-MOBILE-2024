//
//  UIViewController+Transition.swift
//  SiriusMap
//
//  Created by Egor on 22.03.2024.
//

import UIKit

extension UIViewController {
    
    func transition(to viewController: UIViewController) {
        addChild(viewController)
        viewController.view.frame = view.bounds
        view.addSubview(viewController.view)
        viewController.didMove(toParent: self)
    }
}
