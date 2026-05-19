//
//  MockScanQRInteractor.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 19/05/26.
//

@testable import QRISApp_iOS

final class MockScanQRInteractor: ScanQRInteractorProtocol {
    
    var mockQRString: String = "BNI.ID12345678.MERCHANT MOCK TEST.50000"
    
    func isValidQRString(_ qrString: String) -> Bool {
        return qrString == mockQRString
    }
}
