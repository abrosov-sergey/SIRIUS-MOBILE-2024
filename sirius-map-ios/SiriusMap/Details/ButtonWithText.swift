//
//  ButtonWithText.swift
//  SiriusMap
//
//  Created by Глеб Писарев on 22.03.2024.
//

import Foundation
import UIKit

final class ButtonWithText: UIButton {
    
    private let width = 130.0
    private let height = 40.0
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: width, height: height)
    }
    
    convenience init(_ text: String) {
        var configuration = UIButton.Configuration.outline()
        configuration.title = text
        
        self.init(configuration: configuration, primaryAction: nil)
        
        setup()
    }
    
    func setup() {
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        layer.shadowOpacity = 0.1
    }
    
}

extension UIButton.Configuration {
    static func outline() -> UIButton.Configuration {
        var style = UIButton.Configuration.plain()
        var background = UIButton.Configuration.plain().background
        style.baseForegroundColor = .white
        background.cornerRadius = 10.0
        background.strokeWidth = 1.0
        background.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.7)
        style.background = background
        
        return style
    }
}
