//
//  MockPaymentInteractor.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 19/05/26.
//

@testable import QRISApp_iOS

final class MockPaymentInteractor: PaymentInteractorProtocol {
    
    var mockRemainingBalance = 50000
    var mockPaymentSucceded = true
    
    func getRemainingBalance() -> Int {
        return mockRemainingBalance
    }
    
    func processPayment(transaction: QRData) -> Bool {
        return mockPaymentSucceded
        
    }
}
