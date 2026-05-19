//
//  MockPaymentResultView.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 19/05/26.
//

@testable import QRISApp_iOS

final class MockPaymentResultView: PaymentResultViewProtocol {
    
    var shownTransaction: QRData?
    var shownRemainingBalance: Int?
    
    func showSuccess(transaction: QRData, remainingBalance: Int) {
        shownTransaction = transaction
        shownRemainingBalance = remainingBalance
    }
    
    func showFailed() {
        print("Payment failed")
    }
}
