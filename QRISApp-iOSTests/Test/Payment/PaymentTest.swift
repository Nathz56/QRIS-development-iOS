//
//  PaymentTest.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 19/05/26.
//

import XCTest
@testable import QRISApp_iOS

final class PaymentTest: XCTestCase {
    
    var testObject: PaymentPresenter!
    
    var mockPaymentInteractor: MockPaymentInteractor!
    var mockPaymentRouter: MockPaymentRouter!
    var mockPaymentView: MockPaymentView!
    
    var mockTransaction: QRData = QRData(bankName: "BNI", transactionID: "ID12345678", merchantName: "MERCHANT MOCK TEST", amount: 50000)
    
    override func setUp() {
        super.setUp()
        
        mockPaymentInteractor = MockPaymentInteractor()
        mockPaymentRouter = MockPaymentRouter()
        mockPaymentView = MockPaymentView()
        
        testObject = PaymentPresenter(interactor: mockPaymentInteractor, router: mockPaymentRouter, transaction: mockTransaction)
        testObject.view = mockPaymentView
        
    }
    
    override func tearDown() {
        testObject = nil
        mockPaymentInteractor = nil
        mockPaymentRouter = nil
        mockPaymentView = nil
        super.tearDown()
    }
    
    func test_didTapConfirmPaymentWhenSuccess() {
        
        mockPaymentInteractor.mockPaymentSucceded = true
        
        testObject.didTapConfirmPayment()
        
        XCTAssertTrue(mockPaymentRouter.navigateToResultWithSuccessCalled)
        XCTAssertFalse(mockPaymentRouter.navigateToResultWithFailedCalled)
    }
        
    func test_didTapConfirmPaymentWhenFailed() {
        
        mockPaymentInteractor.mockPaymentSucceded = false
        
        testObject.didTapConfirmPayment()
        
        XCTAssertTrue(mockPaymentRouter.navigateToResultWithFailedCalled)
        XCTAssertFalse(mockPaymentRouter.navigateToResultWithSuccessCalled)
    }
        
    func test_shouldShowTransactionDetail() {
        
        mockPaymentInteractor.mockRemainingBalance = 50000
        
        testObject.viewDidLoad()
        
        XCTAssertEqual(mockPaymentView.shownTransaction?.merchantName, "MERCHANT MOCK TEST")
        XCTAssertEqual(mockPaymentView.shownRemainingBalance, 50000)
    }
    
}

