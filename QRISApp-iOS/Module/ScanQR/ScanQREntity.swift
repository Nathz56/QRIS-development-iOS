//
//  ScanQREntity.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 14/05/26.
//

struct ScanQREntity {
    let bankName: String
    let transactionID: String
    let merchantName: String
    let amount: Int
}

struct TransactionEntity {
    let transactionID: String
    let transactionDate: String
    let merchantName: String
    let amount: String
}
