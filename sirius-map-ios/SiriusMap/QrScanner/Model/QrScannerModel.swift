//
//  QrScannerModel.swift
//  SiriusMap
//
//  Created by Sergey Abrosov on 26.03.2024.
//

import Foundation

// MARK: - Model Input

protocol QrScannerModelInput {
    
}

// MARK: - Controller Output

protocol QrScannerModelOutput: AnyObject {
    
}

// MARK: - QrScannerModel

final class QrScannerModel {
    weak var output: QrScannerModelOutput?
}

// MARK: - Model Input

extension QrScannerModel: QrScannerModelInput {
    
}

