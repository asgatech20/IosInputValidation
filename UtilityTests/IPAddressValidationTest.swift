//
//  IPAddressValidationTest.swift
//  UtilityTests
//
//  Created by Khaled Mahmoud on 19/12/2021.
//

import XCTest
@testable import Utility

class IPAddressValidationTest: XCTestCase {

    // Regex : "^(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[0-9]{1,2})(\\.(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[0-9]{1,2})){3}$"
    
    let validIPAddressList = [ "250.250.250.250" ,"255.255.255.255"
                              ,"200.200.200.200" ,"249.249.249.249"
                              ,"100.100.100.100" ,"199.199.199.199"
                              ,"0.0.0.0" ,"99.99.99.99"]
    
    let inValidIPAddressList = [ "256.0.0.2" ,"0.300.255.255"
                              ,"200.200.200" ,"249.249"
                              ,"100.100.1000.100" ,"199.199.199.299"
                              ,"0..0" ,"99.99.99.900"]
    // valid ipAdrress
    func testIPAddress_validIPAddress_returnFalse() {
        validIPAddressList.forEach {
            XCTAssertTrue(Validator.validate(text: $0, with: .ipAddress))
        }
    }
    
    // invalid ipAdrress
    func testIPAddress_inValidIPAddress_returnFalse() {
        inValidIPAddressList.forEach {
            XCTAssertFalse(Validator.validate(text: $0, with: .ipAddress))
        }
    }
}
