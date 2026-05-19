//
//  TransactionHistoryTest.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 19/05/26.
//

import XCTest
@testable import QRISApp_iOS

final class TransactionHistoryPresenterTests: XCTestCase {
    
    var testObject: TransactionHistoryPresenter!
    
    var mockTransactionHistoryView: MockTransactionHistoryView!
    var mockTransactionHistoryInteractor: MockTransactionHistoryInteractor!
    var mockTransactionHistoryRouter: MockTransactionHistoryRouter!
    
    override func setUp() {
        super.setUp()
        
        mockTransactionHistoryView = MockTransactionHistoryView()
        mockTransactionHistoryInteractor = MockTransactionHistoryInteractor()
        mockTransactionHistoryRouter = MockTransactionHistoryRouter()
        
        testObject = TransactionHistoryPresenter(interactor: mockTransactionHistoryInteractor, router: mockTransactionHistoryRouter)
        testObject.view = mockTransactionHistoryView
    }
    
    override func tearDown() {
        testObject = nil
        
        mockTransactionHistoryView = nil
        mockTransactionHistoryInteractor = nil
        mockTransactionHistoryRouter = nil
        
        super.tearDown()
    }
    
    func test_TransactionsNotEmptyShouldShowTransactions() {
        let expectedTransactions = [
            QRData(bankName: "BNI", transactionID: "TX01", merchantName: "Toko Buku", amount: 50000),
        ]
        mockTransactionHistoryInteractor.mockedTransactions = expectedTransactions
        
        testObject.viewDidLoad()
        
        XCTAssertTrue(mockTransactionHistoryInteractor.fetchTransactionsCalled)
        XCTAssertTrue(mockTransactionHistoryView.showTransactionsCalled)
        XCTAssertEqual(mockTransactionHistoryView.capturedTransactions.count, 1)
        XCTAssertEqual(mockTransactionHistoryView.capturedTransactions.first?.merchantName, "Toko Buku")
    }
    
    func test_whenTransactionsIsEmptyShouldShowEmptyState() {
        
        mockTransactionHistoryInteractor.mockedTransactions = []
        
        testObject.viewDidLoad()
        
        XCTAssertTrue(mockTransactionHistoryInteractor.fetchTransactionsCalled)
        XCTAssertTrue(mockTransactionHistoryView.showEmptyCalled)
    }
}
