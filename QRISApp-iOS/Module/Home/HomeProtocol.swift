//
//  HomeProtocol.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 14/05/26.
//

protocol HomeViewProtocol: AnyObject {
    func showBalance(_ balance: Int)
}

protocol HomePresenterProtocol: AnyObject {
    func viewDidLoad()
    func viewWillAppear()
    func didTapScan()
    func didTapHistory()
}

protocol HomeInteractorProtocol: AnyObject {
    func getBalance() -> Int
}

protocol HomeRouterProtocol: AnyObject {
    func navigateToScanQR()
    func navigateToHistory()
}
