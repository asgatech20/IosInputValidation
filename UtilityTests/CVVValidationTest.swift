//
//  CVVValidationTest.swift
//  UtilityTests
//
//  Created by Khaled Mahmoud on 19/12/2021.
//

import XCTest
@testable import Utility

class CVVValidationTest: XCTestCase {

    // Regex : "^[0-9]{3,4}$"
    
    // correct cvv of 3 digits
    func testCVV_validCVVWith3Digits_returnTrue() {
        XCTAssertTrue(Validator.validate(text: "123", with: .cvvNumber))
    }
    
    // correct cvv of 4 digits
    func testCVV_validCVVWith4Digits_returnTrue() {
        XCTAssertTrue(Validator.validate(text: "1234", with: .cvvNumber))
    }
    
    // fail because it contain 2 digits < 3
    func testCVV_invalidCVVWith2Digits_returnFalse() {
        XCTAssertFalse(Validator.validate(text: "12", with: .cvvNumber))
    }
    
    // fail because it contain 5 digits > 4
    func testCVV_invalidCVVWit5Digits_returnFalse() {
        XCTAssertFalse(Validator.validate(text: "12345", with: .cvvNumber))
    }
    
    // fail because it contain dot (not a number)
    func testCVV_invalidCVVContainingDot_returnFalse() {
        XCTAssertFalse(Validator.validate(text: "1.2", with: .cvvNumber))
    }
}
