//
//  MasterCardValidationTest.swift
//  UtilityTests
//
//  Created by Khaled Mahmoud on 19/12/2021.
//

import XCTest
@testable import Utility

class MasterCardValidationTest: XCTestCase {
    
    // Regex : "^5[1-5][0-9]{14}|^(222[1-9]|22[3-9]\\d|2[3-6]\\d{2}|27[0-1]\\d|2720)[0-9]{12}$"
   
    let validMasterCardNumberList = [
         "5129187892858887" //first two-digits range from 51 to 55.
        ,"5529187892858887" //first two-digits range from 51 to 55.
        ,"2221187892858887" //first four-digits range from 2221 to 2229.
        ,"2229187892858887" //first four-digits range from 2221 to 2229.
        ,"2230187892858887" //first four-digits range from 2230 to 2299.
        ,"2299187892858887" //first four-digits range from 2230 to 2299.
        ,"2300187892858887" //first four-digits range from 2300 to 2699.
        ,"2699187892858887" //first four-digits range from 2300 to 2699.
        ,"2700187892858887" //first four-digits range from 2700 to 2719.
        ,"2719187892858887" //first four-digits range from 2700 to 2719.
        ,"2720187892858887" //first four-digits 2720.
    ]
    
    let inValidMasterCardNumberList = [
        "5029187892858887" //first digit not in range from 51 to 55.
        ,"552918789285888"  //count = 15 not 16
    ]
    
    // correct mastercards
    func testMasterCard_validMasterCardNumbers_returnTrue() {
        validMasterCardNumberList.forEach {
            XCTAssertTrue(Validator.validate(text: $0, with: .masterCard))
        }
    }
    
    // failed mastercards
    func testMasterCard_inValidMasterCardNumbers_returnTrue() {
        inValidMasterCardNumberList.forEach {
            XCTAssertFalse(Validator.validate(text: $0, with: .masterCard))
        }
    }
}
