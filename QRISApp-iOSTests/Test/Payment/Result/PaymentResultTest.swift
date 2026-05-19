//
//  PaymentResultTest.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 19/05/26.
//

import XCTest
@testable import QRISApp_iOS

final class PaymentResultTest: XCTestCase {
    
    var testObject: PaymentResultPresenter!
    
    var mockPaymentResultRouter: MockPaymentResultRouter!
    var mockPaymentResultView: MockPaymentResultView!
    
    var mockTransaction: QRData = QRData(bankName: "BNI", transactionID: "ID12345678", merchantName: "MERCHANT MOCK TEST", amount: 50000)
    var mockRemainingBalance: Int = 5000
    
    override func setUp() {
        super.setUp()
        
        mockPaymentResultRouter = MockPaymentResultRouter()
        mockPaymentResultView = MockPaymentResultView()
        
        testObject = PaymentResultPresenter(router: mockPaymentResultRouter, success: true, transaction: mockTransaction, remainingBalance: mockRemainingBalance )
        testObject.view = mockPaymentResultView
    }
    
    override func tearDown() {
        testObject = nil
        mockPaymentResultRouter = nil
        mockPaymentResultView = nil
        super.tearDown()
    }
    
    func test_paymentResultSuccess() {
        
        mockPaymentResultView.shownRemainingBalance = mockRemainingBalance
        
        testObject.viewDidLoad()
        testObject.didTapDone()
        
        XCTAssertEqual(mockPaymentResultView.shownRemainingBalance, mockRemainingBalance)
        XCTAssertTrue(mockPaymentResultRouter.navigateToHomeCalled)
    }
    
    func test_paymentResultFailed() {
        
        mockPaymentResultRouter.navigateToHomeCalled = false
        
        testObject.didTapDone()
        
        XCTAssertTrue(mockPaymentResultRouter.navigateToHomeCalled)

    }
}
