//
//  TransactionHistoryPresenter.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 16/05/26.
//

final class TransactionHistoryPresenter: TransactionHistoryPresenterProtocol {
    
    weak var view: TransactionHistoryViewProtocol?
    let interactor: TransactionHistoryInteractorProtocol
    let router: TransactionHistoryRouterProtocol
    
    init(interactor: TransactionHistoryInteractorProtocol, router: TransactionHistoryRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        let transactions = interactor.fetchTransactions()
        if transactions.isEmpty {
            view?.showEmpty()
        } else {
            view?.showTransactions(transactions)
        }
    }
}
