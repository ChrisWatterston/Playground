import UIKit


// ////////////////// ------ FUNCTIONS
//    func letsPlayWith(_ name: String, nameOfObject hisObject: String, numOfHits hitNumber: Int) -> String {
//        print("Say hello to \(name), are you playing with the a \(hisObject)")
//        print("You've hit the ball \(hitNumber) times")
//        
//        return "hey, how you doing"
//    }
//
//    letsPlayWith("Bob", nameOfObject: "Cricket Bat", numOfHits: 23)
//
//
//    func sumEquation(a: Int, b:Int, c:Int) -> (sum: Int, biggestNum: Int) {
//        let biggestNum = a > b ? a : b
//        let sum = biggestNum + c
//        return (biggestNum,sum)
//    }
//
//    var equal = sumEquation(a: 33, b: 34, c: 5)
//
//    print(equal)



// ////////////////// ------ ENUMERATION
//    enum WoodTypes {
//        case Oak(String)
//        case Walnut(String)
//        case Maple(String)
//    }
//
//    var checkingWood = WoodTypes.Oak("Oak")
//
//    switch checkingWood {
//    case .Oak(let oakT):
//        print("This wood is \(oakT)")
//    case .Walnut(let malnutT):
//        print("This wood is \(malnutT)")
//    default:
//        print("Not sure what this wood is?")
//    }


// ////////////////// ------ MESSAGE TO GEORGINA
//var iLoveQuote = "I love you..."
//func letsStateAFact(percentage:String) -> String {
//    enum LovePercentage {
//        case Ten(String)
//        case Fourty(String)
//        case OneHundred(String)
//        case Zero(String)
//    }
//    
//    let loveCheck = LovePercentage.OneHundred("\(percentage)")
//    var outcome = String()
//    
//    switch loveCheck {
//    case .Ten(let fact):
//        outcome = ("\(iLoveQuote) \(fact) percent, FACT!")
//    case .Fourty(let fact):
//        outcome = ("\(iLoveQuote) \(fact) percent, FACT!")
//    case .OneHundred(let fact):
//        outcome = ("\(iLoveQuote) \(fact) percent, FACT!")
//    default:
//        outcome = ("\(iLoveQuote) not.")
//    }
//    return outcome
//}
//print(letsStateAFact(percentage: "onehundred"))







var date = "25-03-2017 03:23"

var year = date.characters.index(of: "-")!
var time = date.characters.index(of: " ")!

let year = String(date.characters.prefix(upTo: yearSpace))


print(year)
print(year.characters.count)


