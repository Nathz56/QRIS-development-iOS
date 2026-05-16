//
//  GenerateQRProtocol.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 16/05/26.
//

import UIKit

protocol GenerateQRViewProtocol: AnyObject {
    func showGeneratedQRCode(_ image: UIImage?)
}

protocol GenerateQRPresenterProtocol: AnyObject {
    func viewDidLoad()
}

protocol GenerateQRInteractorProtocol: AnyObject {
    func generateQRCode(from entity: QRData) -> UIImage?
}

protocol GenerateQRRouterProtocol: AnyObject {
    func navigateToHome()
}
