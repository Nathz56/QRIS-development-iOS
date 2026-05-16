//
//  PaymentProtocol.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 16/05/26.
//

protocol PaymentViewProtocol: AnyObject {
    func showPaymentSuccess(transaction: ScanQREntity, remainingBalance: Int)
    func showPaymentFailed(message: String)
}

protocol PaymentPresenterProtocol: AnyObject {
    func viewDidLoad()
    func didTapConfirmPayment()
}

protocol PaymentInteractorProtocol: AnyObject {
    func processPayment(transaction: ScanQREntity) -> Bool
    func getRemainingBalance() -> Int
}

protocol PaymentRouterProtocol: AnyObject {
    func navigateToPaymentSuccess()
    func navigateToPaymentFailed()
    func navigateToHome()
}


