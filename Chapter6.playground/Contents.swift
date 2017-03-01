import UIKit
import Foundation


// ------------ playing with Protocals -------------- //
protocol PersonProtocal {
    var firstName: String {get set}
    var lastName: String {get set}
    var birthDate: NSDate {get set}
    var profession: String {get set}
    
    init(firstName: String, lastName: String, birhtDate: NSDate)
}

class personClass {
    
}

func updatePerson(person: PersonProtocal) -> PersonProtocal {
    return person
}


// ------------ playing with Protocal Extentions -------------- //
protocol DogProtocal {
    var name: String {get set}
    var colour: String {get set}
}

extension DogProtocal {
    func speak() -> String {
        return "Woof Woof"
    }
}

struct JackRussel: DogProtocal {
    var name: String
    var colour: String
}

class WhiteLab: DogProtocal {
    var name: String
    var colour: String
    init(name: String, colour: String) {
        self.name = name
        self.colour = colour
    }
    func speak() -> String {
        return "I've eaten, so not hungry any more."
    }
}

struct Mutt: DogProtocal {
    var name: String
    var colour: String
}

let dash = JackRussel(name: "Dash", colour: "Brown")
let lily = WhiteLab(name: "Lily", colour: "Pink")
let buddy = Mutt(name: "Buddy", colour: "Orange")

let speakDash = dash.speak()
let speakLily = lily.speak()
let speakBuddy = buddy.speak()





//protocol TextValidation {
//    var regExMatchingString: String {get}
//    var regExFindMatchString: String {get}
//    var validationMessage: String {get}
//    func validateString(str: String) -> Bool
//    func getMatchingString(str: String) -> String?
//}
//
//class AlphaValidation1: TextValidation {
//    static let sharedInstance = AlphaValidation1()
//    private init(){}
//    
//    let regExFindMatchString = "^[a-zA-Z]{0,10}"
//    let validationMessage = "Can only contain Alpha characters"
//    
//    var regExMatchingString: String { get {
//        return regExFindMatchString + "$"
//        }
//    }
//    
//    func validateString(str: String) -> Bool {
//        if let _ = str.range(of: regExMatchingString, options: .regularExpression) {
//            return true
//        } else {
//            return false
//        }
//    }
//    
//    func getMatchingString(str: String) -> String? {
//        if let newMatch = str.range(of: regExFindMatchString, options: .regularExpression) {
//            return str.substring(with: newMatch)
//        } else {
//            return nil
//        }
//    }
//}

protocol TextValidating {
    var regExFindMarchString: String {get}
    var validationMessage: String {get}
}

extension TextValidating {
    var regExMatchingString: String { get {
        return self.regExMatchingString + "$"
        }
    }
    func validateString(str: String) -> Bool {
        if let _ = str.range(of: regExMatchingString, options: .regularExpression) {
            return true
        } else {
            return false
        }
    }
    func getMatchingString(str: String) -> String? {
        if let newMatch = str.range(of: regExFindMarchString, options: .regularExpression) {
            return str.substring(with: newMatch)
        } else {
            return nil
        }
    }
}

struct AlphaValidation: TextValidating {
    static let sharedInstance = AlphaValidation()
    private init(){}
    let regExFindMarchString = "^[a-zA-Z]{0,10}"
    let validationMessage = "Can only contain Alpha Numeric characters"
}

struct AlphaNumericValidation: TextValidating {
    static let sharedInstance = AlphaNumericValidation()
    private init(){}
    let regExFindMarchString = "^[a-zA-Z0-9]{0,15}"
    let validationMessage = "Can only contain Alpha characters"
}

struct DisplayNameValidation: TextValidating {
    static let sharedInstance = DisplayNameValidation()
    private init(){}
    let regExFindMarchString = "^[\\s?[a-zA-Z0-9\\-_\\s]]{0,15}"
    let validationMessage = "Display name can only contain Alphanumeric characters"
}


var validators = [UITextField: TextValidating]()

validators[alphaTextField] = AlphaValidation.sharedInstance
validators[alphaNumericTextField] = AlphaNumericValidation.sharedInstance
validators[displayNameTextField] = DisplayNameValidation.sharedInstance

// MOVED TO XCODE PROJECT AS STARTED TO GET WARNING, WANT TO SEE IF THIS MADE A DIFFERENCE.




















