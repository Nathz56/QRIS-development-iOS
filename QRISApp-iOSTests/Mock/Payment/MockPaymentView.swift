//
//  MockPaymentView.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 19/05/26.
//

import XCTest
@testable import QRISApp_iOS

final class MockPaymentView: PaymentViewProtocol {
    
    var shownTransaction: QRData?
    var shownRemainingBalance: Int?
    var shownFailedMessage: String?
        
    func showPaymentSuccess(transaction: QRData, remainingBalance: Int) {
        shownTransaction = transaction
        shownRemainingBalance = remainingBalance
    }
        
    func showPaymentFailed(message: String) {
        shownFailedMessage = message
    }
}
