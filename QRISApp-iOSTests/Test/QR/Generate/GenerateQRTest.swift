//
//  GenerateQRTest.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 19/05/26.
//

import XCTest
@testable import QRISApp_iOS

final class GenerateQRTest: XCTestCase {
    
    var testObject: GenerateQRPresenter!
    
    var mockGenerateQRInteractor: MockGenerateQRInteractor!
    var mockGenerateQRRouter: MockGenerateQRRouter!
    var mockGenerateQRView: MockGenerateQRView!
    
    override func setUp() {
        super.setUp()
        
        mockGenerateQRInteractor = MockGenerateQRInteractor()
        mockGenerateQRRouter = MockGenerateQRRouter()
        mockGenerateQRView = MockGenerateQRView()
        
        testObject = GenerateQRPresenter(interactor: mockGenerateQRInteractor, router: mockGenerateQRRouter)
        testObject.view = mockGenerateQRView
    }
    
    override func tearDown() {
        testObject = nil
        
        mockGenerateQRView = nil
        mockGenerateQRRouter = nil
        mockGenerateQRInteractor = nil
        super.tearDown()
    }
    
    func test_viewDidLoad_shouldTriggerInteractorAndShowQRInView() {
        
        let expectedImage = UIImage()
        mockGenerateQRInteractor.mockedImage = expectedImage
        
        testObject.viewDidLoad()
        
        XCTAssertTrue(mockGenerateQRView.isShowGeneratedQRCodeCalled)
        XCTAssertEqual(mockGenerateQRView.capturedImage, expectedImage)
    }
    
}
