//
//  ScanQRInteractor.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 15/05/26.
//

final class ScanQRInteractor: ScanQRInteractorProtocol {
    
    private let parser = QRParser()
    
    func isValidQRString(_ qrString: String) -> Bool {
        return parser.parse(qrString) != nil
    }
}
