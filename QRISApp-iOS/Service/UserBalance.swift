//
//  UserBalance.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 16/05/26.
//

final class UserBalance {
    static let shared = UserBalance()
    private init() {}
    
    private(set) var balance: Int = 99999
    private(set) var transactions: [QRData] = []
    
    func deduct(amount: Int) -> Bool {
        guard amount > 0, amount <= balance else {
            return false
        }
        
        balance -= amount
        return true
    }
    
    func addTransaction(_ transaction: QRData) {
        transactions.insert(transaction, at: 0)
    }
}
