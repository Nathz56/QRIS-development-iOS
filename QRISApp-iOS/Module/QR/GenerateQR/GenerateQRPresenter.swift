//
//  GenerateQRPresenter.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 16/05/26.
//

import Foundation
import UIKit

final class GenerateQRPresenter: GenerateQRPresenterProtocol {
    
    weak var view: GenerateQRViewProtocol?
    
    let interactor: GenerateQRInteractorProtocol
    let router: GenerateQRRouterProtocol
    
    private let parser = QRParser()
    
    private let entity = QRData(
         bankName: "BNI",
         transactionID: "ID12345678",
         merchantName: "MERCHANT MOCK TEST",
         amount: 50000
     )
    
    init(interactor: GenerateQRInteractorProtocol, router: GenerateQRRouterProtocol) {
          self.interactor = interactor
          self.router = router
      }
    
    func viewDidLoad() {
        let image = interactor.generateQRCode(from: entity)
        view?.showGeneratedQRCode(image)
    }
}
