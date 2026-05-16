//
//  GenerateQRInteractor.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 16/05/26.
//

import UIKit
import CoreImage

final class GenerateQRInteractor: GenerateQRInteractorProtocol {
    
    private let parser = QRParser()
    
    func generateQRCode(from entity: QRData) -> UIImage? {
        let qrString = parser.buildQRString(entity)
        
        guard let data = qrString.data(using: .utf8),
              let filter =  CIFilter(name: "CIQRCodeGenerator") else { return nil }
        
        filter.setValue(data, forKey: "inputMessage")
        filter.setValue("M", forKey: "inputCorrectionLevel")
        
        guard let output = filter.outputImage else { return nil }
               let scaled = output.transformed(by: CGAffineTransform(scaleX: 10, y: 10))
               return UIImage(ciImage: scaled)
    }
}
