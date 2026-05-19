//
//  MockGenerateQRRouter.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 19/05/26.
//

@testable import QRISApp_iOS
import UIKit

final class MockGenerateQRRouter: GenerateQRRouterProtocol {
    
    var navigateToHomeCalled = false
    
    func navigateToHome() {
        navigateToHomeCalled = true
    }
}
