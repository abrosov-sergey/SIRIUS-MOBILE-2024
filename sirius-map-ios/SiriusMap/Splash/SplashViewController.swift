//
//  SplashViewController.swift
//  SiriusMap
//
//  Created by Sergey Abrosov on 28.03.2024.
//

import UIKit

final class SplashViewController: UIViewController {
    // MARK: - Properties

    var backgroundImage = UIImageView(image: UIImage(named: "SplashBackground"))
    var logoImageView = UIImageView(image: UIImage(named: "SiriusMapIcon"))

    var logoIsHidden: Bool = false
    var textImage: UIImage?

    static let logoImageBig: UIImage = .init(named: "SiriusMapIcon")!

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        for item in [backgroundImage, logoImageView] {
            view.addSubview(item)
        }

        NSLayoutConstraint.activate([
            backgroundImage.heightAnchor.constraint(equalTo: view.heightAnchor),
            backgroundImage.widthAnchor.constraint(equalTo: view.widthAnchor),
            backgroundImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])

        NSLayoutConstraint.activate([
            logoImageView.widthAnchor.constraint(equalToConstant: 240.0),
            logoImageView.heightAnchor.constraint(equalToConstant: 128.0),
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 362.0),
            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 76.0),
        ])
    }
}
