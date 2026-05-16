//
//  HomePresenter.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 14/05/26.
//

import Foundation
import UIKit

final class HomePresenter: HomePresenterProtocol {
    
    weak var view: HomeViewProtocol?
    
    let interactor: HomeInteractorProtocol
    let router: HomeRouterProtocol
    
    var balance: Int = 0
    
    init (
        interactor: HomeInteractorProtocol,
        router: HomeRouterProtocol
    ){
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
    }
    
    func viewWillAppear() {
        fetchBalance()
        showBalance()
    }
    
    func didTapScan() {
        router.navigateToScanQR()
    }
    
    func didTapHistory() {
        router.navigateToHistory()
    }
    
    func fetchBalance() {
        balance = interactor.getBalance()
    }
    
    func showBalance() {
        view?.showBalance(balance)
    }
}
