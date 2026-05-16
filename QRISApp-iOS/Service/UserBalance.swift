//
//  UserBalance.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 16/05/26.
//

final class UserBalance {
    static let shared = UserBalance()
    private init() {}
    
    var balance: Int = 99999
    
    func deduct(amount: Int) {
        balance -= amount
    }
}
