//
//  MockTransactionHistoryRouter.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 19/05/26.
//

@testable import QRISApp_iOS

final class MockTransactionHistoryRouter: TransactionHistoryRouterProtocol {
    
    var navigateToHomeCalled = false
    
    func navigateToHome() {
        navigateToHomeCalled = true
    }
}
