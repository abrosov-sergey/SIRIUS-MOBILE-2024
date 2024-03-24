//
//  MapItemDetailViewController.swift
//  SiriusMap
//
//  Created by Egor on 21.03.2024.
//

import UIKit

protocol SearchNavigationControllerDelegate: AnyObject {
    func resize()
}

final class MapItemDetailViewController: UIViewController {
    
    weak var delegate: SearchNavigationControllerDelegate?
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let fromHereButton = ButtonWithText("Отсюда")
    private let hereButton = ButtonWithText("Сюда")
    
    let buttonStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 36.0
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
        isModalInPresentation = true
        view.backgroundColor = .systemBackground
        setup()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate?.resize()
    }
    
    private func setup() {
        nameLabel.text = name
        
        view.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0.0),
            nameLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
        
        fromHereButton.addTarget(
            self,
            action: #selector(onFromHereButtonClicked),
            for: .allTouchEvents
        )
        hereButton.addTarget(
            self,
            action: #selector(onHereButtonClicked),
            for: .allTouchEvents
        )
        
        buttonStack.addArrangedSubview(fromHereButton)
        buttonStack.addArrangedSubview(hereButton)
        
        view.addSubview(buttonStack)
        
        NSLayoutConstraint.activate([
            buttonStack.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 24.0),
            buttonStack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    
    @objc func onFromHereButtonClicked() {
        
    }
    
    @objc func onHereButtonClicked() {
        
    }
}
