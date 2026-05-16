//
//  PaymentResultProtocol.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 16/05/26.
//

protocol PaymentResultViewProtocol: AnyObject {
    func showSuccess(transaction: QRData, remainingBalance: Int)
    func showFailed()
}

protocol PaymentResultPresenterProtocol: AnyObject {
    func viewDidLoad()
    func didTapDone()
}

protocol PaymentResultRouterProtocol: AnyObject {
    func navigateToHome()
}
