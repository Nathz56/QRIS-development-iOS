//
//  MockHomeRouter.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 19/05/26.
//

@testable import QRISApp_iOS

final class MockHomeRouter: HomeRouterProtocol {
    var navigateToScanQRCalled = false
    var navigateToHistoryCalled = false
    var navigateToGenerateQRCalled = false
    
    func navigateToScanQR() {
        navigateToScanQRCalled = true
    }
    
    func navigateToHistory() {
        navigateToHistoryCalled = true
    }
    
    func navigateToGenerateQR() {
        navigateToGenerateQRCalled = true
    }
}
