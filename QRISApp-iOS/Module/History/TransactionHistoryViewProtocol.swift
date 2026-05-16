//
//  TransactionHistoryViewProtocol.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 16/05/26.
//

import UIKit

protocol TransactionHistoryViewProtocol: AnyObject {
    func showTransactions(_ transactions: [ScanQREntity])
    func showEmpty()
}

protocol TransactionHistoryPresenterProtocol: AnyObject {
    func viewDidLoad()
}

protocol TransactionHistoryInteractorProtocol: AnyObject {
    func fetchTransactions() -> [ScanQREntity]
}

protocol TransactionHistoryRouterProtocol: AnyObject {
    func navigateToHome()
}
