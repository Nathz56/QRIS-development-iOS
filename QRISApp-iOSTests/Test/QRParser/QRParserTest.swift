//
//  QRParserTest.swift
//  QRISApp-iOS
//
//  Created by Yonathan Hilkia on 19/05/26.
//

import XCTest
@testable import QRISApp_iOS

final class QRParserTest: XCTestCase {
    
    var testObject: QRParser!
    
    override func setUp() {
        super.setUp()
        
        testObject = QRParser()
    }
    
    override func tearDown() {
        testObject = nil
        super.tearDown()
    }
    
    func test_validQRParsing() {
        
        let qrString = "BNI.ID12345678.MERCHANT MOCK TEST.50000"
        let result = testObject.parse(qrString)
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.bankName, "BNI")
        XCTAssertEqual(result?.transactionID, "ID12345678")
        XCTAssertEqual(result?.merchantName, "MERCHANT MOCK TEST")
        XCTAssertEqual(result?.amount, 50000)
    }
    
    func test_invalidQRString() {
        
        let qrString = "BNI.ID12345678"
        let result = testObject.parse(qrString)
        
        XCTAssertNil(result)
    }
    
    func test_invalidAmount() {
        let qrString = "BNI.ID12345678.MERCHANT.tessalah"
        let result = testObject.parse(qrString)
        
        XCTAssertEqual(result?.amount, 0)
        XCTAssertNotNil(result)
    }
}
