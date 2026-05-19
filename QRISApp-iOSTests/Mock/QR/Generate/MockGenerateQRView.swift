//
//  MockGenerateQRView.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 19/05/26.
//

@testable import QRISApp_iOS
import UIKit

final class MockGenerateQRView: GenerateQRViewProtocol {
    
    var isShowGeneratedQRCodeCalled = false
    var capturedImage: UIImage?
    
    func showGeneratedQRCode(_ image: UIImage?) {
        isShowGeneratedQRCodeCalled = true
        capturedImage = image
    }
}
