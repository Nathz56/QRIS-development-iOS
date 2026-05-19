//
//  MockTransactionHistoryView.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 19/05/26.
//

@testable import QRISApp_iOS

final class MockTransactionHistoryView: TransactionHistoryViewProtocol {
    
    var showTransactionsCalled = false
    var capturedTransactions: [QRData] = []
    
    var showEmptyCalled = false
    
    func showTransactions(_ transactions: [QRData]) {
        showTransactionsCalled = true
        capturedTransactions = transactions
    }
    
    func showEmpty() {
        showEmptyCalled = true
    }
}
