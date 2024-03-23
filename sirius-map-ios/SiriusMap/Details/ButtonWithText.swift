//
//  ButtonWithText.swift
//  SiriusMap
//
//  Created by Глеб Писарев on 22.03.2024.
//

import Foundation
import UIKit

final class ButtonWithText: UIButton {
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 130, height: 40)
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
    public static func outline() -> UIButton.Configuration {
        var style = UIButton.Configuration.plain()
        var background = UIButton.Configuration.plain().background
        style.baseForegroundColor = .white
        background.cornerRadius = 10
        background.strokeWidth = 1
        background.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.7)
        style.background = background
        
        return style
    }
}
