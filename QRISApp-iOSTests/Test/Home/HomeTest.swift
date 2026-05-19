//
//  HomeTest.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 19/05/26.
//

import XCTest
@testable import QRISApp_iOS

final class HomeTest: XCTestCase {
    
    var testObject: HomePresenter!
    
    var mockHomeInteractor: MockHomeInteractor!
    var mockHomeRouter: MockHomeRouter!
    var mockHomeView: MockHomeView!
    
    override func setUp() {
        super.setUp()
        
        mockHomeInteractor = MockHomeInteractor()
        mockHomeRouter = MockHomeRouter()
        mockHomeView = MockHomeView()
        
        testObject = HomePresenter(interactor: mockHomeInteractor, router: mockHomeRouter)
        testObject.view = mockHomeView
    }
    
    override func tearDown() {
        testObject = nil
        mockHomeInteractor = nil
        mockHomeRouter = nil
        mockHomeView = nil
        super.tearDown()
    }
    
    func test_showCorrectBalance() {
        
        mockHomeInteractor.mockBalance = 100000
        
        testObject.viewWillAppear()
        
        XCTAssertEqual(mockHomeView.shownBalance, 100000)
        
    }
    
    func test_randomBalance() {
        
        mockHomeInteractor.mockBalance = 0
        
        testObject.viewWillAppear()
        
        XCTAssertEqual(mockHomeView.shownBalance, 0)
    }
    
    func test_navigationToScanQR() {
        
        mockHomeRouter.navigateToScanQRCalled = false
        
        testObject.didTapScan()
        
        XCTAssertEqual(mockHomeRouter.navigateToScanQRCalled, true)
        
    }
    
    func test_navigationToHistory() {
        
        mockHomeRouter.navigateToHistoryCalled = false
        
        testObject.didTapHistory()
        
        XCTAssertEqual(mockHomeRouter.navigateToHistoryCalled, true)
        
    }
    
    func test_navigationToGenerateQR() {
        
        mockHomeRouter.navigateToGenerateQRCalled = false
        
        testObject.didTapGenerateQR()
        
        XCTAssertEqual(mockHomeRouter.navigateToGenerateQRCalled, true)
        
    }
}
