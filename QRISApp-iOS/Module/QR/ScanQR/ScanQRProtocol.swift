//
//  ScanQRProtocol.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 15/05/26.
//

import UIKit

protocol ScanQRViewProtocol: AnyObject {
}

protocol ScanQRPresenterProtocol: AnyObject {
    func viewDidLoad()
    func didScanQRCode(qrString: String)
    
}

protocol ScanQRInteractorProtocol: AnyObject {
    func isValidQRString(_ qrString: String) -> Bool
}

protocol ScanQRRouterProtocol: AnyObject {
    func navigateToPayment(transaction: QRData)
}
