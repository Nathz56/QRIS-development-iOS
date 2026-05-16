//
//  PaymentResultRouter.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 16/05/26.
//

import UIKit

final class PaymentResultRouter: PaymentResultRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule(success: Bool, transaction: ScanQREntity?, remainingBalance: Int?) -> UIViewController {
        let router = PaymentResultRouter()
        let presenter = PaymentResultPresenter(
            router: router,
            success: success,
            transaction: transaction,
            remainingBalance: remainingBalance
        )
        let viewController = PaymentResultViewController(presenter: presenter)
        
        presenter.view = viewController
        router.viewController = viewController
        
        return viewController
    }
    
    func navigateToHome() {
        viewController?.navigationController?.popToRootViewController(animated: true)
    }
}
