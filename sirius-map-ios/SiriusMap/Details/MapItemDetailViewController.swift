//
//  MapItemDetailViewController.swift
//  SiriusMap
//
//  Created by Egor on 21.03.2024.
//

protocol SearchNavigationControllerDeligate: AnyObject {
    func resize()
}

import UIKit

final class MapItemDetailViewController: UIViewController {
    
    weak var deligate: SearchNavigationControllerDeligate!
    
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
        
        let nameLabel = UILabel()
        nameLabel.text = name
        nameLabel.font = UIFont.systemFont(ofSize: 24)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = view.safeAreaLayoutGuide
        
        view.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 0),
            nameLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
        ])
        
        let fromHereButton = ButtonWithText("Отсюда")
        let hereButton = ButtonWithText("Сюда")
        
        fromHereButton.addTarget(self, action: #selector(onFromHereButtonClicked), for: .allTouchEvents)
        hereButton.addTarget(self, action: #selector(onHereButtonClicked), for: .allTouchEvents)
        
        let buttonStack = UIStackView()
        buttonStack.axis = .horizontal
        buttonStack.distribution = .fillEqually
        buttonStack.spacing = 36
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        
        buttonStack.addArrangedSubview(fromHereButton)
        buttonStack.addArrangedSubview(hereButton)
        
        view.addSubview(buttonStack)
        
        NSLayoutConstraint.activate([
            buttonStack.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 24),
            buttonStack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        deligate.resize()
    }
    
    
    @objc func onFromHereButtonClicked() {
        
    }
    
    @objc func onHereButtonClicked() {
        
    }
}
