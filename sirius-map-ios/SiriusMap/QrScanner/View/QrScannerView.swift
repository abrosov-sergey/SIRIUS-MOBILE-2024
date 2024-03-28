//
//  QrScannerView.swift
//  SiriusMap
//
//  Created by Sergey Abrosov on 26.03.2024.
//

import UIKit

// MARK: - View Input

protocol QrScannerViewInput {}

// MARK: - Controller Output

protocol QrScannerViewOutput: AnyObject {}

// MARK: - RouteBuildingView

final class QrScannerView: UIView {
    weak var output: QrScannerViewOutput?
}

// MARK: - View Input

extension QrScannerView: QrScannerViewInput {}
