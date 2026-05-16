//
//  TransactionHistoryRouter.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 16/05/26.
//

import UIKit

final class TransactionHistoryRouter: TransactionHistoryRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let interactor = TransactionHistoryInteractor()
        
        let router = TransactionHistoryRouter()
        
        let presenter = TransactionHistoryPresenter(
            interactor: interactor,
            router: router
        )
        let viewController = TransactionHistoryViewController(
            presenter: presenter
        )
        
        presenter.view = viewController
        
        router.viewController = viewController
        
        return viewController
    }
    
    func navigateToHome() {
        viewController?.navigationController?.popToRootViewController(animated: true)
    }
}
