//
//  TransactionHistoryInteractor.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 16/05/26.
//


final class TransactionHistoryInteractor: TransactionHistoryInteractorProtocol {
    
    func fetchTransactions() -> [ScanQREntity] {
        return UserBalance.shared.transactions
    }
}
