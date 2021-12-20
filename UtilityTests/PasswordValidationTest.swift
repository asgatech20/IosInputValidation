//
//  PasswordValidationTest.swift
//  UtilityTests
//
//  Created by Khaled Mahmoud on 16/12/2021.
//

import XCTest
@testable import Utility

class PasswordValidationTest: XCTestCase {
    //small and capital ,numbers and speical
    func testPasswordMustContainCapital_ReturnTrue() {
        XCTAssertTrue(Validator.validate(text: "Kh123@123", with: .password(characteristics: InputCharacteristic(minLength: 8, maxLength: 20, containDot: .maybe, containUnderScore: .maybe, containSpecialCharacter: .must, containNumbers: .must, containCapitalLetters: .must))))
    }
    
    // small and numbers
    func testPasswordOnlyContainingNumbers_ReturnTrue() {
        XCTAssertTrue(Validator.validate(text: "12345678", with: .password(characteristics: InputCharacteristic(minLength: 8, maxLength: 20, containLetters: .none, containDot: .none, containUnderScore: .none, containSpecialCharacter: .none, containNumbers: .must, containCapitalLetters: .none))))
    }
}
