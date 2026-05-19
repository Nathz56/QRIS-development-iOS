//
//  MockPaymentResultRouter.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 19/05/26.
//

import XCTest
@testable import QRISApp_iOS

final class MockPaymentRouter: PaymentRouterProtocol {
    
    var navigateToResultWithSuccessCalled = false
    var navigateToResultWithFailedCalled = false
    var navigateToHomeCalled = false
    
    func navigateToPaymentSuccess() {
        navigateToResultWithSuccessCalled = true
    }
    
    func navigateToPaymentFailed() {
        navigateToResultWithFailedCalled = true
    }
    
    func navigateToHome() {
        navigateToHomeCalled = true
    }
}
    

