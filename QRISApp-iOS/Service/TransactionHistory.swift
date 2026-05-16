//
//  TransactionHistory.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 16/05/26.
//

final class TransactionHistory {
    static let shared = TransactionHistory()
    private init() {}
    
    private(set) var transactions: [QRData] = []
    
    func addTransactionToHistory(transaction: QRData) {
        transactions.insert(transaction, at: 0)
    }
}
