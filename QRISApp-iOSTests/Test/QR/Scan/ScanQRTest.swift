//
//  ScanQRTest.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 19/05/26.
//

import XCTest
@testable import QRISApp_iOS

final class ScanQRTest: XCTestCase {
    
    var testObject: ScanQRPresenter!
    
    var mockScanQRInteractor: MockScanQRInteractor!
    var mockScanQRRouter: MockScanQRRouter!
    
    override func setUp() {
        super.setUp()
        
        mockScanQRInteractor = MockScanQRInteractor()
        mockScanQRRouter = MockScanQRRouter()
        
        testObject = ScanQRPresenter(interactor: mockScanQRInteractor, router: mockScanQRRouter)
    }
    
    override func tearDown() {
        
        testObject = nil
        
        mockScanQRInteractor = nil
        mockScanQRRouter = nil
        
        super.tearDown()
    }
    
    func test_isQRStringValid() {
        
        let qrString = "BNI.ID12345678.MERCHANT MOCK TEST.50000"
        
        testObject.didScanQRCode(qrString: qrString)
        
        XCTAssertTrue(mockScanQRRouter.navigateToPaymentCalled)
    }
    
    func test_isQRStringInvalid() {

        let qrString = "INVALID.e.e.e"

        testObject.didScanQRCode(qrString: qrString)

        XCTAssertFalse(mockScanQRRouter.navigateToPaymentCalled)
    }
}
