//
//  PaymentRouter.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 16/05/26.
//

import UIKit

final class PaymentRouter: PaymentRouterProtocol{
    
    weak var viewController: UIViewController?
    var transaction: ScanQREntity?
    
    static func createModule(transaction: ScanQREntity) -> UIViewController {
        
        let interactor = PaymentInteractor()
        
        let router = PaymentRouter()
        
        let presenter = PaymentPresenter(
            interactor: interactor,
            router: router,
            transaction: transaction
        )
        
        let viewController = PaymentViewController(
            presenter: presenter
        )
        
        presenter.view = viewController
        
        router.viewController = viewController
        router.transaction = transaction
        
        return viewController
        
    }
    
    func navigateToPaymentSuccess() {
        let paymentSuccessViewController = PaymentResultRouter.createModule(
            success: true,
            transaction: transaction,
            remainingBalance: UserBalance.shared.balance
        )
        viewController?.navigationController?.pushViewController(paymentSuccessViewController, animated: true)
    }
    
    func navigateToPaymentFailed() {
        let paymentFailedViewController = PaymentResultRouter.createModule(
            success: false,
            transaction: transaction,
            remainingBalance: UserBalance.shared.balance
        )
        viewController?.navigationController?.pushViewController(paymentFailedViewController, animated: true)
    }
    
    func navigateToHome() {
        viewController?.navigationController?.popToRootViewController(animated: true)
    }
}
