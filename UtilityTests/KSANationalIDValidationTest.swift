//
//  KSANationalIDValidationTest.swift
//  UtilityTests
//
//  Created by Khaled Mahmoud on 20/12/2021.
//

import XCTest
@testable import Utility

class KSANationalIDValidationTest: XCTestCase {
   
    let validKSANationalIDNumberList = [
         "1001244019" //first num = 1.
        ,"1058529940" //first num = 1.
    ]
    
    let inValidKSANationalIDNumberList = [
         "302918789285888" //first digit not 1 or 2.
        ,"342918789"  //count = 9 not 10
    ]
    
    // correct KSANationalIDs
    func testKSANationalID_validKSANationalIDNumbers_returnTrue() {
        validKSANationalIDNumberList.forEach {
            XCTAssertTrue(Validator.validate(text: $0, with: .ksaNationalID))
        }
    }
    
    // failed KSANationalIDs
    func testKSANationalID_inValidKSANationalIDNumbers_returnTrue() {
        inValidKSANationalIDNumberList.forEach {
            XCTAssertFalse(Validator.validate(text: $0, with: .ksaNationalID))
        }
    }
}
