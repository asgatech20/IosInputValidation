//
//  UserNameValidationTest.swift
//  UtilityTests
//
//  Created by Khaled Mahmoud on 15/12/2021.
//

import XCTest
@testable import Utility

class UserNameValidationTest: XCTestCase {
    
    //small and capital letters
    func testUserNameMustContainCapital_ReturnTrue() {
        XCTAssertTrue(Validator.validate(text: "Khaled", with: .userName(characteristics: InputCharacteristic(minLength: 3, maxLength: 20, containDot: .none, containUnderScore: .none, containSpecialCharacter: .none, containNumbers: .none, containCapitalLetters: .must))))
    }
    
    // small and .
    func testUserNameMustContainDot_ReturnTrue() {
        XCTAssertTrue(Validator.validate(text: "khaled.", with: .userName(characteristics: InputCharacteristic(minLength: 3, maxLength: 20, containDot: .must, containUnderScore: .none, containSpecialCharacter: .none, containNumbers: .none, containCapitalLetters: .none))))
    }
    
    // small and _
    func testUserNameMustContainUnderScore_ReturnTrue() {
        XCTAssertTrue(Validator.validate(text: "kh_aled", with: .userName(characteristics: InputCharacteristic(minLength: 3, maxLength: 20, containDot: .none, containUnderScore: .must, containSpecialCharacter: .none, containNumbers: .none, containCapitalLetters: .none))))
    }
    
    // small and special
    func testUserNameMustContainSpecial_ReturnTrue() {
        XCTAssertTrue(Validator.validate(text: "kh@aled", with: .userName(characteristics: InputCharacteristic(minLength: 3, maxLength: 20, containDot: .none, containUnderScore: .none, containSpecialCharacter: .must, containNumbers: .none, containCapitalLetters: .none))))
    }
    
    // small and numbers
    func testUserNameMustContainNumbers_ReturnTrue() {
        XCTAssertTrue(Validator.validate(text: "khaled123", with: .userName(characteristics: InputCharacteristic(minLength: 3, maxLength: 20, containDot: .none, containUnderScore: .none, containSpecialCharacter: .none, containNumbers: .must, containCapitalLetters: .none))))
    }
    
    // small, capital, _, numbers
    func testUserNameWithCapitalAndUnderScoreAndNumbers_ReturnTrue() {
        XCTAssertTrue(Validator.validate(text: "Khaled_123", with: .userName(characteristics: InputCharacteristic(minLength: 3, maxLength: 20, containDot: .none, containUnderScore: .must, containSpecialCharacter: .none, containNumbers: .must, containCapitalLetters: .must))))
    }
    
    // optional
    func testUserNameWithOptionalContaining_ReturnTrue() {
        XCTAssertTrue(Validator.validate(text: "khaled123", with: .userName(characteristics: InputCharacteristic(minLength: 3, maxLength: 20, containDot: .maybe, containUnderScore: .maybe, containSpecialCharacter: .none, containNumbers: .maybe, containCapitalLetters: .maybe))), "Text count less than 3")
    }
    
    // small count < min
    func testUserNameWithLessThan3Letters_ReturnFalse() {
        XCTAssertFalse(Validator.validate(text: "kh", with: .userName(characteristics: InputCharacteristic(minLength: 3, maxLength: 20, containDot: .none, containUnderScore: .none, containSpecialCharacter: .none, containNumbers: .must, containCapitalLetters: .none))), "Text count less than 3")
    }
    
    // small count > max
    func testUserNameWithMoreThan20Letters_ReturnFalse() {
        XCTAssertFalse(Validator.validate(text: "khaled123khaled123456", with: .userName(characteristics: InputCharacteristic(minLength: 3, maxLength: 20, containDot: .none, containUnderScore: .none, containSpecialCharacter: .none, containNumbers: .must, containCapitalLetters: .none))))
    }
}
