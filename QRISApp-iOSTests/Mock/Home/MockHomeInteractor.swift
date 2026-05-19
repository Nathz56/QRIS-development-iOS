//
//  MockHomeInteractor.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 19/05/26.
//

@testable import QRISApp_iOS

final class MockHomeInteractor: HomeInteractorProtocol {
    var mockBalance: Int = 100000
    
    func getBalance() -> Int {
        return mockBalance
    }
    
    func fetchTransactions() -> [QRData] {
        return []
    }
}
