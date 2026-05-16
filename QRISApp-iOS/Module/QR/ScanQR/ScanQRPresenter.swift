//
//  ScanQRPresenter.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 15/05/26.
//

import Foundation
import UIKit

final class ScanQRPresenter: ScanQRPresenterProtocol {
    
    weak var view: ScanQRViewProtocol?
    let interactor: ScanQRInteractorProtocol
    let router: ScanQRRouterProtocol
    private let parser = QRParser()
    
    init(interactor: ScanQRInteractorProtocol, router: ScanQRRouterProtocol) {
          self.interactor = interactor
          self.router = router
      }
    
    func viewDidLoad() {}
    
    func didScanQRCode(qrString: String) {
        guard interactor.isValidQRString(qrString) else { return }
        guard let transaction = parser.parse(qrString) else { return }
        router.navigateToPayment(transaction: transaction)
    }
}


