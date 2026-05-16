//
//  ScanQRRouter.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 15/05/26.
//

import UIKit

final class ScanQRRouter: ScanQRRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        
        let interactor = ScanQRInteractor()
        
        let router = ScanQRRouter()
        
        let presenter = ScanQRPresenter(
            interactor: interactor,
            router: router
        )
        
        let viewController = ScanQRViewController(
            presenter: presenter
        )
        
        presenter.view = viewController
        
        router.viewController = viewController
        
        return viewController
        
    }
    
    func navigateToPayment(transaction: ScanQREntity) {
        viewController?.navigationController?.popToRootViewController(animated: true)
    }
    
}
    


