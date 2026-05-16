//
//  ScanQRProtocol.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 15/05/26.
//

import UIKit

protocol ScanQRViewProtocol: AnyObject {
    func showGeneratedQRCode(_ image: UIImage?)
}

protocol ScanQRPresenterProtocol: AnyObject {
    func viewDidLoad()
    func didTapGenerateQRCode()
    func didScanQRCode(qrString: String)
    
}

protocol ScanQRInteractorProtocol: AnyObject {
    func generateQRCode(from entity: ScanQREntity) -> UIImage?
}

protocol ScanQRRouterProtocol: AnyObject {
    func navigateToPayment(transaction: ScanQREntity)
}
