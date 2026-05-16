//
//  PaymentInteractor.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 16/05/26.
//

final class PaymentInteractor: PaymentInteractorProtocol {
    
    func processPayment(transaction: ScanQREntity) -> Bool {
        let currentBalance = UserBalance.shared.balance
        
        guard currentBalance >= transaction.amount else {
            return false //pastiin balance diats jumlah yg mau ditransaksi
        }
        
        guard transaction.amount > 0 else {
            return false
        }
        
        UserBalance.shared.deduct(amount: transaction.amount)
        return true
    }
    
    func getRemainingBalance() -> Int {
        return UserBalance.shared.balance
    }
    
}
