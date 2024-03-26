//
//  QrScannerController.swift
//  SiriusMap
//
//  Created by Sergey Abrosov on 26.03.2024.
//

import UIKit

// MARK: - QrScannerController

final class QrScannerController: UIViewController {
    var mainView: QrScannerViewInput?
    var model: QrScannerModelInput?
}

// MARK: - Model Output

extension QrScannerController: QrScannerModelOutput {
    
}

// MARK: - View Output

extension QrScannerController: QrScannerViewOutput {
    
}
