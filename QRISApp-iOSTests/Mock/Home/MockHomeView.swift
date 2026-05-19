//
//  MockHomeView.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 19/05/26.
//

@testable import QRISApp_iOS

final class MockHomeView: HomeViewProtocol {
    var shownBalance: Int?
    
    func showBalance(_ balance: Int) {
        shownBalance = balance
    }
}
