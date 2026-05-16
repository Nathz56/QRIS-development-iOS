//
//  QRParser.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 15/05/26.
//

final class QRParser {
    
    func parse(_ rawString: String) -> ScanQREntity? {
        
        let components = rawString.split(separator: ".")
        guard components.count == 4 else { return nil }
        
        return ScanQREntity(bankName: String(components[0]),
                          transactionID: String(components[1]),
                          merchantName: String(components[2]),
                          amount: Int(components[3]) ?? 0
        )
    }
    
    func buildQRString(_ entity: ScanQREntity) -> String {
        return "\(entity.bankName).\(entity.transactionID).\(entity.merchantName).\(entity.amount)"
    }
}

