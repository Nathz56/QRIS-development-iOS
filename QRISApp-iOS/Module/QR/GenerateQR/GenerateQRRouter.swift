//
//  GenerateQRRouter.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 16/05/26.
//

import UIKit

final class GenerateQRRouter: GenerateQRRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        
        let interactor = GenerateQRInteractor()
        
        let router = GenerateQRRouter()
        
        let presenter = GenerateQRPresenter(
            interactor: interactor,
            router: router
        )
        
        let viewController = GenerateQRViewController(
            presenter: presenter
        )
        
        presenter.view = viewController
        
        router.viewController = viewController
        
        return viewController
        
    }
    
    func navigateToHome() {
        
        viewController?.dismiss(animated: true, completion: nil)
    }
    
}
