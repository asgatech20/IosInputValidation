//
//  VisaCardValidationTest.swift
//  UtilityTests
//
//  Created by Khaled Mahmoud on 16/12/2021.
//

import XCTest
@testable import Utility

class VisaCardValidationTest: XCTestCase {

    // Regex : "^4[0-9]{12}(?:[0-9]{3})?$"
    
    // correct Visa of 16 digits
    func testVisa_validVisaWith16Digits_returnTrue() {
        XCTAssertTrue(Validator.validate(text: "4111111111111111", with: .visaCard))
    }
    
    // correct Visa of 13 digits
    func testVisa_validVisaWith13Digits_returnTrue() {
        XCTAssertTrue(Validator.validate(text: "4111111111111", with: .visaCard))
    }
    
    // fialed because first number is not 4
    func testVisa_invalidVisaWithout4InStart_returnFalse() {
        XCTAssertFalse(Validator.validate(text: "0111111111111", with: .visaCard))
    }
    
    // fialed because count more than 16
    func testVisa_invalidVisaWithMoreThan16Digits_returnFalse() {
        XCTAssertFalse(Validator.validate(text: "41111111111111117", with: .visaCard))
    }
    
    // fialed because count less than 16 and more than 13
    func testVisa_invalidVisaWith14Digits_returnFalse() {
        XCTAssertFalse(Validator.validate(text: "41111111111114", with: .visaCard))
    }
    
    // fialed because count less than 13
    func testVisa_invalidVisaWithLessThan13Digits_returnFalse() {
        XCTAssertFalse(Validator.validate(text: "41111111111", with: .visaCard))
    }
}
