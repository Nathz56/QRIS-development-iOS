//
//  MockTransactionHistoryInteractor.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 19/05/26.
//

@testable import QRISApp_iOS

final class MockTransactionHistoryInteractor: TransactionHistoryInteractorProtocol {
    
    var fetchTransactionsCalled = false
    
    var mockedTransactions: [QRData] = []
    
    func fetchTransactions() -> [QRData] {
        fetchTransactionsCalled = true
        return mockedTransactions
    }
}
