//
//  HomeProtocol.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 14/05/26.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    func showBalance(_ balanceAmount: Int)
}

protocol HomePresenterProtocol: AnyObject {
    func viewDidLoad()
    func didTapScan()
}

protocol HomeInteractorProtocol: AnyObject {
    func getBalance() -> Int
}

protocol HomeRouterProtocol: AnyObject {
    func navigateToScanQR()
}
