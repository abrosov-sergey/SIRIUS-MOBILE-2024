//
//  MapItemDetailViewController.swift
//  SiriusMap
//
//  Created by Egor on 21.03.2024.
//

import UIKit

protocol MapItemDetailDelegate: AnyObject {
    func fromButtonTapped()
    func toButtonTapped()
    func didDisappear()
}

final class MapItemDetailViewController: UIViewController {
    
    weak var delegate: MapItemDetailDelegate?
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = name
        label.font = UIFont.systemFont(ofSize: 24.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = name
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let fromHereButton = ButtonWithText("Отсюда", style: .gray)
    private let hereButton = ButtonWithText("Сюда", style: .blue)
    
    private let buttonStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 30.0
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let name: String
    
    init(name: String) {
        self.name = name
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let sheet = sheetPresentationController {
            let fraction = UISheetPresentationController.Detent.custom { _ in 130 }
            sheet.detents = [fraction]
            
            sheet.animateChanges {
                sheet.selectedDetentIdentifier = sheet.selectedDetentIdentifier ?? .medium
            }
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        delegate?.didDisappear()
    }
    
    private func setup() {
        view.addSubview(nameLabel)
        view.addSubview(descriptionLabel)
        
        fromHereButton.addTarget(
            self,
            action: #selector(toButtonTapped),
            for: .touchUpInside
        )
        hereButton.addTarget(
            self,
            action: #selector(fromButtonTapped),
            for: .touchUpInside
        )
        
        buttonStack.addArrangedSubview(fromHereButton)
        buttonStack.addArrangedSubview(hereButton)
        
        view.addSubview(buttonStack)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -42),
            nameLabel.leadingAnchor.constraint(equalTo: buttonStack.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2.0),
            descriptionLabel.leadingAnchor.constraint(equalTo: buttonStack.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            hereButton.widthAnchor.constraint(equalToConstant: 130.0),
            hereButton.heightAnchor.constraint(equalToConstant: 40.0)
        ])
        
        NSLayoutConstraint.activate([
            fromHereButton.widthAnchor.constraint(equalToConstant: 130.0),
            fromHereButton.heightAnchor.constraint(equalToConstant: 40.0)
        ])
        
        NSLayoutConstraint.activate([
            buttonStack.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20.0),
            buttonStack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    
    @objc private func fromButtonTapped() {
        delegate?.toButtonTapped()
    }
    
    @objc private func toButtonTapped() {
        delegate?.fromButtonTapped()
    }
}
