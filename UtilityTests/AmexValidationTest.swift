//
//  AmexValidationTest.swift
//  UtilityTests
//
//  Created by Khaled Mahmoud on 20/12/2021.
//

import XCTest
@testable import Utility

class AmexValidationTest: XCTestCase {

    // Regex : "^3[47][0-9]{13}$"
   
    let validAmexCardNumberList = [
         "342918789285888" //first two-digits 34.
        ,"372918789285888" //first two-digits 37.
    ]
    
    let inValidAmexCardNumberList = [
         "302918789285888" //first two-digit not 34 or 37.
        ,"34291878928"  //count = 11 not 15
    ]
    
    // correct AmexCards
    func testAmexCard_validAmexCardNumbers_returnTrue() {
        validAmexCardNumberList.forEach {
            XCTAssertTrue(Validator.validate(text: $0, with: .amexCard))
        }
    }
    
    // failed AmexCards
    func testAmexCard_inValidAmexCardNumbers_returnTrue() {
        inValidAmexCardNumberList.forEach {
            XCTAssertFalse(Validator.validate(text: $0, with: .amexCard))
        }
    }
}
