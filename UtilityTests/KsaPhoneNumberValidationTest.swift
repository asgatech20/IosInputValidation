//
//  KsaPhoneNumberTest.swift
//  UtilityTests
//
//  Created by Khaled Mahmoud on 16/12/2021.
//

import XCTest
@testable import Utility

class KsaPhoneNumberValidationTest: XCTestCase {

    // Regex : "^(009665|9665|\\+9665|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{7})$"
    
    // correct number
    func testPhone_validKSAPhoneStartWith009665_returnTrue() {
        XCTAssertTrue(Validator.validate(text: "00966551122334", with: .ksaPhone))
    }
    
    // correct number
    func testKSAPhone_validKSAPhoneStartWith9665_returnTrue() {
        XCTAssertTrue(Validator.validate(text: "966551122334", with: .ksaPhone))
    }
    
    // correct number
    func testKSAPhone_validKSAPhoneStartWithPlus9665_returnTrue() {
        XCTAssertTrue(Validator.validate(text: "+966551122334", with: .ksaPhone))
    }
    
    // correct number
    func testKSAPhone_validKSAPhoneStartWith05_returnTrue() {
        XCTAssertTrue(Validator.validate(text: "0551122334", with: .ksaPhone))
    }
    
    // correct number
    func testKSAPhone_validKSAPhoneStartWith5_returnTrue() {
        XCTAssertTrue(Validator.validate(text: "551122334", with: .ksaPhone))
    }
    
    // failed because second number is 2
    func testKSAPhone_validKSAPhoneStartWith5_returnFalse() {
        XCTAssertFalse(Validator.validate(text: "521122334", with: .ksaPhone))
    }
}
