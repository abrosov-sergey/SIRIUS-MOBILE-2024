//
//  ButtonWithText.swift
//  SiriusMap
//
//  Created by Глеб Писарев on 22.03.2024.
//

import Foundation
import UIKit

enum ButtonWithTextStyle {
    case blue
    case gray
}

final class ButtonWithText: UIButton {
    
    convenience init(_ text: String, style: ButtonWithTextStyle = .blue) {
        switch style {
        case .blue:
            var configuration = UIButton.Configuration.outlineBlue()
            configuration.title = text
            self.init(configuration: configuration, primaryAction: nil)
        case .gray:
            var configuration = UIButton.Configuration.outlineGray()
            configuration.title = text
            self.init(configuration: configuration, primaryAction: nil)
        }
        
        setup()
    }
    
    func setup() {
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        layer.shadowOpacity = 0.1
    }
    
}

extension UIButton.Configuration {
    static func outlineBlue() -> UIButton.Configuration {
        var style = UIButton.Configuration.plain()
        var background = UIButton.Configuration.plain().background
        style.baseForegroundColor = .white
        background.cornerRadius = 10.0
        background.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.7)
        style.background = background
        
        return style
    }
    static func outlineGray() -> UIButton.Configuration {
        var style = UIButton.Configuration.plain()
        var background = UIButton.Configuration.plain().background
        style.baseForegroundColor = .systemGray
        background.cornerRadius = 10.0
        background.strokeWidth = 1.0
        background.strokeColor = .systemGray
        style.background = background
        
        return style
    }
}
