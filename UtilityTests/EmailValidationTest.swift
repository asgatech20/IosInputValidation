//
//  EmailValidationTest.swift
//  UtilityTests
//
//  Created by Khaled Mahmoud on 16/12/2021.
//

import XCTest
@testable import Utility
class EmailValidationTest: XCTestCase {
    
    // Regex : "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    
    // correct email
    func testEmail_validEmail_returnTrue() {
        XCTAssertTrue(Validator.validate(text: "A.Z_0%9+z-a@a.s-d.Com", with: .email))
    }
    
    // fail because no @ exist
    func testEmail_invalidEmailWithoutAt_returnFalse() {
        XCTAssertFalse(Validator.validate(text: "asdasd.com", with: .email))
    }
    
    // fail because no . exist
    func testEmail_invalidEmailWithoutDot_returnFalse() {
        XCTAssertFalse(Validator.validate(text: "asd@asdcom", with: .email))
    }
    
    // fail because .c
    func testEmail_invalidEmailWithSingleCharacterAfterDot_returnFalse() {
        XCTAssertFalse(Validator.validate(text: "asd@asd.c", with: .email))
    }
}
