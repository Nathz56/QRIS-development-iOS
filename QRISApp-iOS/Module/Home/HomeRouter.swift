//
//  HomeRouter.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 14/05/26.
//

import UIKit

final class HomeRouter: HomeRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {

        let interactor = HomeInteractor()

        let router = HomeRouter()

        let presenter = HomePresenter(
            interactor: interactor,
            router: router
        )

        let viewController = HomeViewController(
            presenter: presenter
        )

        presenter.view = viewController

        router.viewController = viewController

        return viewController
    }
    
    func navigateToScanQR() {
        
        let scanQRViewController = ScanQRRouter.createModule()
        viewController?.navigationController?.pushViewController(scanQRViewController, animated: true)
        
    }
    
}
