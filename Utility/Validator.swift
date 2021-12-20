//
//  File.swift
//  Utility
//
//  Created by Khaled Mahmoud on 12/12/2021.
//

import Foundation

struct InputCharacteristic {
    var minLength: Int
    var maxLength: Int
    var containLetters: RegexAddintionState = .must
    var containDot: RegexAddintionState
    var containUnderScore: RegexAddintionState
    var containSpecialCharacter: RegexAddintionState
    var containNumbers: RegexAddintionState
    var containCapitalLetters: RegexAddintionState
}

enum InputType {
    case customInput(characteristics: InputCharacteristic)
    case userName(characteristics: InputCharacteristic)
    case password(characteristics: InputCharacteristic)
    case email
    case egyptPhone
    case ksaPhone
    case egyptNationalID
    case ksaNationalID
    case paymentCard
    case visaCard
    case masterCard
    case amexCard
    case cvvNumber
    case ipAddress
}

enum Regex: String {
    case email = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
    case egyptPhone = "^01[0-2,5]{1}[0-9]{8}$"
    case ksaPhone = "^(009665|9665|\\+9665|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{7})$"
    case visaCard = "^4[0-9]{12}(?:[0-9]{3})?$"
    case masterCard = "^5[1-5][0-9]{14}|^(222[1-9]|22[3-9]\\d|2[3-6]\\d{2}|27[0-1]\\d|2720)[0-9]{12}$"
    case amexCard = "^3[47][0-9]{13}$"
    case cvvNumber = "^[0-9]{3,4}$"
    case paymentCard = "^(?:4[0-9]{12}(?:[0-9]{3})?|(?:5[1-5][0-9]{2}|222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720)[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|6(?:011|5[0-9]{2})[0-9]{12}|(?:2131|1800|35\\d{3})\\d{11})$"

    case ipAddress = "^(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[0-9]{1,2})(\\.(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[0-9]{1,2})){3}$"
    
    case egyptNationalID = "^(2|3)[0-9][1-9][0-1][1-9][0-3][1-9](01|02|03|04|11|12|13|14|15|16|17|18|19|21|22|23|24|25|26|27|28|29|31|32|33|34|35|88)\\d{5}$"
}

enum SmallLettersRegex: String, CaseIterable {
    case mustContain = "(?=.*[a-z])"
    case optionalContain = "(.*[a-z]*?)"
    case notContain = "(?!.*[a-z])"
}

enum CapitalLettersRegex: String, CaseIterable {
    case mustContain = "(?=.*[A-Z])"
    case optionalContain = "(.*[A-Z]*?)"
    case notContain = "(?!.*[A-Z])"
}

enum DotRegex: String, CaseIterable {
    case mustContain = "(?=.*[.])"
    case optionalContain = "(.*[.]*?)"
    case notContain = "(?!.*[.])"
}

enum UnderScoreRegex: String, CaseIterable {
    case mustContain = "(?=.*[_])"
    case optionalContain = "(.*[_]*?)"
    case notContain = "(?!.*[_])"
}

enum SpecialCharactersRegex: String, CaseIterable {
    case mustContain = "(?=.*[-+!@#\\$%^&*,?])"
    case optionalContain = "(.*[-+!@#\\$%^&*,?]*?)"
    case notContain = "(?!.*[-+!@#\\$%^&*,?])"
}

enum NumbersRegex: String, CaseIterable {
    case mustContain = "(?=.*\\d)"
    case optionalContain = "(.*\\d*?)"
    case notContain = "(?!.*\\d)"
}

enum RegexAddintionState: Int {
    case must = 0
    case maybe = 1
    case none = 2
}

class Validator {
    static func validate(text: String, with type: InputType) -> Bool {
        var regex = ""
        switch type {
        case .customInput(characteristics: let characteristics):
            regex = getInputRegexString(characteristics: characteristics)
        case .userName(characteristics: let characteristics):
            regex = getInputRegexString(characteristics: characteristics)
        case .password(characteristics: let characteristics):
            regex = getInputRegexString(characteristics: characteristics)
        case .email:
            regex = Regex.email.rawValue
        case .egyptPhone:
            regex = Regex.egyptPhone.rawValue
        case .ksaPhone:
            regex = Regex.ksaPhone.rawValue
        case .egyptNationalID:
            regex = Regex.egyptNationalID.rawValue
        case .ksaNationalID:
            return validateKSANationalID(text: text)
        case .paymentCard:
            regex = Regex.paymentCard.rawValue
        case .visaCard:
            regex = Regex.visaCard.rawValue
        case .masterCard:
            regex = Regex.masterCard.rawValue
        case .amexCard:
            regex = Regex.amexCard.rawValue
        case .cvvNumber:
            regex = Regex.cvvNumber.rawValue
        case .ipAddress:
            regex = Regex.ipAddress.rawValue
        }
        return check(text: text, regex: regex)
    }
    
    static func getInputRegexString(characteristics: InputCharacteristic) -> String {
        return
            SmallLettersRegex.allCases[characteristics.containLetters.rawValue].rawValue +
        DotRegex.allCases[characteristics.containDot.rawValue].rawValue +
        UnderScoreRegex.allCases[characteristics.containUnderScore.rawValue].rawValue +
        SpecialCharactersRegex.allCases[characteristics.containSpecialCharacter.rawValue].rawValue +
        NumbersRegex.allCases[characteristics.containNumbers.rawValue].rawValue +
        CapitalLettersRegex.allCases[characteristics.containCapitalLetters.rawValue].rawValue +
        ".{\(characteristics.minLength),\(characteristics.maxLength)}$"
    }
    
    static func check(text: String, regex: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: text)
    }
    
    static func validateKSANationalID(text: String) -> Bool {
        // check for count
        if (text.count != 10) { return false }
        // check for first number
        guard let type = Int(String(text.first!)) else { return false}
        if type != 2 && type != 1 { return false }
        // check for idNumber is valid numeric number
        if Int(text) == nil { return false }
        // get sum
        let sum = text.enumerated().reduce(0) { (sum, item) -> Int in
            let i = item.offset
            var sumTemp = sum
            if (i % 2 == 0) {
                let ZFOdd = String(format: "%02d", Int(String(text.charAt(at: i)))! * 2)
                sumTemp += Int(String(ZFOdd.charAt(at: 0)))! + Int(String(ZFOdd.charAt(at: 1)))!
            } else {
                sumTemp += Int(String(text.charAt(at: i)))!
            }
            return sumTemp
        }
        // check for sum
        if (sum % 10 != 0) {
            return false
        }else if (type == 1) {
            return true
        }else if (type == 2) {
            return true
        }
        return false
    }
}
