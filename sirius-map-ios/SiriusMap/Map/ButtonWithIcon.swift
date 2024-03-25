//
//  SearchButton.swift
//  SiriusMobileIOS
//
//  Created by Глеб Писарев on 21.03.2024.
//

import UIKit

enum IconType: String {
    case search = "magnifyingglass.circle.fill"
    case pin = "mappin.circle.fill"
}

final class ButtonWithIcon: UIButton {
    
    init(type: IconType = .search) {
        super.init(frame: .zero)
        setup(type)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(_ type: IconType) {
        
        let config = UIImage.SymbolConfiguration(
            pointSize: 56
        )
            .applying(
                UIImage.SymbolConfiguration(
                    paletteColors: [
                        .darkGray,
                        .white
                    ]
                )
            )
        
        let buttonImage = UIImage(systemName: type.rawValue, withConfiguration: config)
        
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        layer.shadowOpacity = 0.1
        
        setImage(buttonImage, for: [])
    
    }
}
