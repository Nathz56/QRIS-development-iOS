//
//  PaymentResultPresenter.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 16/05/26.
//

final class PaymentResultPresenter: PaymentResultPresenterProtocol {
    
    weak var view: PaymentResultViewProtocol?
    let router: PaymentResultRouterProtocol
    let success: Bool
    let transaction: QRData?
    let remainingBalance: Int?
    
    init(router: PaymentResultRouterProtocol, success: Bool, transaction: QRData?, remainingBalance: Int?) {
        self.router = router
        self.success = success
        self.transaction = transaction
        self.remainingBalance = remainingBalance
    }
    
    func viewDidLoad() {
        if success, let transaction = transaction, let remaining = remainingBalance {
            view?.showSuccess(transaction: transaction, remainingBalance: remaining)
        } else {
            view?.showFailed()
        }
    }
    
    func didTapDone() {
        router.navigateToHome()
    }
}
