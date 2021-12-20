//
//  EgyPhoneNumberTest.swift
//  UtilityTests
//
//  Created by Khaled Mahmoud on 16/12/2021.
//

import XCTest
@testable import Utility

class EgyPhoneNumberValidationTest: XCTestCase {

    // Regex : "^01[0-2,5]{1}[0-9]{8}$"
    
    // correct number
    func testEgyPhone_validEgyPhone_returnTrue() {
        XCTAssertTrue(Validator.validate(text: "01122334455", with: .egyptPhone))
    }
    
    // failed because not 01 in begining
    func testEgyPhone_invalidEgyPhonefirstNumberNotZero_returnFalse() {
        XCTAssertFalse(Validator.validate(text: "11122334455", with: .egyptPhone))
    }
    
    // failed because no [0-2,5] after 01
    func testEgyPhone_invalidEgyPhoneinvalidNumberAfter01_returnFalse() {
        XCTAssertFalse(Validator.validate(text: "01922334455", with: .egyptPhone))
    }
    
    // failed because numbers count more than 8 after first 3 valid numbers
    func testEgyPhone_invalidEgyPhonemoreThan8Nums_returnFalse() {
        XCTAssertFalse(Validator.validate(text: "011223344556", with: .egyptPhone))
    }
    
    // failed because numbers count less than 8 after first 3 valid numbers
    func testEgyPhone_invalidEgyPhonelessThan8Nums_returnFalse() {
        XCTAssertFalse(Validator.validate(text: "0112233445", with: .egyptPhone))
    }
}
