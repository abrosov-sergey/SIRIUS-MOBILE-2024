//
//  RootViewController.swift
//  SiriusMap
//
//  Created by Egor on 22.03.2024.
//

import UIKit

final class RootViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transition(to: SearchNavigationController())
    }
}
