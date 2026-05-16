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
    
    private let entity = ScanQREntity(
         bankName: "BNI",
         transactionID: "ID12345678",
         merchantName: "MERCHANT MOCK TEST",
         amount: 50000
     )
    
    init(interactor: ScanQRInteractorProtocol, router: ScanQRRouterProtocol) {
          self.interactor = interactor
          self.router = router
      }
    
    func viewDidLoad() {}
    
    func didTapGenerateQRCode() {
           let image = interactor.generateQRCode(from: entity)
           view?.showGeneratedQRCode(image)
       }
    
    func didScanQRCode(qrString: String) {
        let image = interactor.generateQRCode(from: entity)
        view?.showGeneratedQRCode(image)
        router.navigateToPayment(transaction: self.entity)
    }
    
}


