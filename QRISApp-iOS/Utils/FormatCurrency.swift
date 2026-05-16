//
//  FormatCurrency.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 16/05/26.
//

import UIKit

enum FormatCurrency {
    static func format(_ amount: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = "."
        return "Rp \(formatter.string(from: NSNumber(value: amount)) ?? "0")"
    }
}
