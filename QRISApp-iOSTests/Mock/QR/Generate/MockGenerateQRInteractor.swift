//
//  MockGenerateQRInteractor.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 19/05/26.
//

@testable import QRISApp_iOS
import UIKit

final class MockGenerateQRInteractor: GenerateQRInteractorProtocol {
    
    var generateQRCodeCalled = false
    var capturedEntity: QRData?
        
    var mockedImage: UIImage? = UIImage()
        
    func generateQRCode(from entity: QRData) -> UIImage? {
        generateQRCodeCalled = true
        capturedEntity = entity
        return mockedImage
    }
}
