//
//  MockScanQRRouter.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 19/05/26.
//

@testable import QRISApp_iOS

final class MockScanQRRouter: ScanQRRouterProtocol {
    
    var navigateToPaymentCalled = false
    
    func navigateToPayment(transaction: QRData) {
        navigateToPaymentCalled = true
    }
}
