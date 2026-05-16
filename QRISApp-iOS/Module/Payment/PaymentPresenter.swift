//
//  PaymentPresenter.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 16/05/26.
//

import Foundation
import UIKit

final class PaymentPresenter: PaymentPresenterProtocol {
    
    weak var view: PaymentViewProtocol?
    
    let interactor: PaymentInteractorProtocol
    let router: PaymentRouterProtocol
    let transaction: QRData
    
    init(
        interactor: PaymentInteractorProtocol,
        router: PaymentRouterProtocol,
        transaction: QRData
    ) {
        self.interactor = interactor
        self.router = router
        self.transaction = transaction
    }
    
    func viewDidLoad() {
        view?.showPaymentSuccess(transaction: transaction, remainingBalance: interactor.getRemainingBalance())
    }
    
    func didTapConfirmPayment() {
        let paymentSuccesss = interactor.processPayment(transaction: transaction)
        if paymentSuccesss {
            UserBalance.shared.addTransaction(transaction)
            router.navigateToPaymentSuccess()
        } else {
            router.navigateToPaymentFailed()
        }
    }
}

