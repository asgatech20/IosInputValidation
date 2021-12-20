//
//  EgyNationalIDValidationTest.swift
//  UtilityTests
//
//  Created by Khaled Mahmoud on 20/12/2021.
//

import XCTest
@testable import Utility

class EgyNationalIDValidationTest: XCTestCase {
  
    // Regex : ^(2|3)[0-9][1-9][0-1][1-9][0-3][1-9](01|02|03|04|11|12|13|14|15|16|17|18|19|21|22|23|24|25|26|27|28|29|31|32|33|34|35|88)\\d{5}
   
    let validEgyNationalIDNumberList = [
         "20101010100634" //first num = 2.
        ,"30101010100634" //first num = 3.
        ,"20101010100634"  //second num range 0-9
        ,"29101010100634" //second num range 0-9
        ,"29101010100634" //third num range 1-9
        ,"29901010100634" //fourth num range 0-1
        ,"29911010100634" //fourth num range 0-1
        ,"29911010100634" //fifth num range 1-9
        ,"29909010100634" //fifth num range 1-9
        ,"29909010100634" //sixth num range 0-3
        ,"29909310100634" //sixth num range 0-3
        ,"29909312700634" //seventh num range 1-9
        ,"29909292700634" //27 one of 8th and 9th group
    ]
    
    let inValidEgyNationalIDNumberList = [
         "302918789285888" //first digit not 2 or 3.
        ,"34291878928"  //count = 11 not 15
    ]
    
    // correct EgyNationalIDs
    func testEgyNationalID_validEgyNationalIDNumbers_returnTrue() {
        validEgyNationalIDNumberList.forEach {
            XCTAssertTrue(Validator.validate(text: $0, with: .egyptNationalID))
        }
    }
    
    // failed EgyNationalIDs
    func testEgyNationalID_inValidEgyNationalIDNumbers_returnTrue() {
        inValidEgyNationalIDNumberList.forEach {
            XCTAssertFalse(Validator.validate(text: $0, with: .egyptNationalID))
        }
    }
}
