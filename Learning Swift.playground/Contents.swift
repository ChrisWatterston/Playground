//: Playground - noun: a place where people can play

import UIKit

// ------------ playing with array -------------- //
var animalList = ["dog", "duck", "cat", "finsh", "spider"]
var colourList = ["yellow", "pink", "orange", "red"]
var countryList = ["england", "united states", "japan", "france", "germany", "switserland"]

countryList.append("austraila")
countryList += colourList
countryList += ["one", "two", "three"]

var insertVar = countryList.count / 2 - 1
countryList.insert("middle man", at: insertVar)

countryList.sort() {
    $0 < $1
}

print(countryList)


var arrayOne = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
let filteredOne = arrayOne.filter{
    $0 > 3 && $0 < 10
}
print(filteredOne)


let filteredTwo = countryList.filter{
    $0.range(of: "e") != nil
}
print(filteredTwo)


print("values between 4 and 8 are \(countryList[3...6])")


var combinedListComma = [[animalList], [colourList], [countryList]]
var combinedListAdd = animalList + colourList + countryList

var countCreatedArray = countryList.count
print("there are \(countCreatedArray) items in our array")

if combinedListComma.isEmpty {
    print("true, this array is empty")
} else {
    print("false, this array is not empty")
}

for eachItem in combinedListAdd {
    print(eachItem)
}


// ------------ playing with dictionary -------------- //
var dictCountry = [
    "UK":"United Kingdom",
    "US":"United States of America",
    "GE":"Germany"
]

var dictResults = dictCountry["US"]
print("this is the \(dictResults)")


// ------------ playing with set -------------- //
var setColours = Set<String>()

setColours.insert("Red")
setColours.insert("Blue")
setColours.insert("Green")
setColours.insert("Blue") //again..
setColours.insert("Purple")

print("The total number of items in our set is \(setColours.count)")

var colourCheck = setColours.contains("Red")
if colourCheck {
    print("Item contains this item")
} else {
    print("Item's not here")
}

for setItem in setColours {
    print(setItem)
}


// ------------ playing with tuples -------------- //
var tupleFacts = ("website", "internet", 2017, 1.8)
var (tupleItem, tupleLocation, tupleYear, tupleSize) = tupleFacts

print("Our \(tupleItem) is based on the \(tupleLocation), created in \(tupleFacts.2) and is \(tupleSize) in size.")
print(tupleFacts.1)


// ------------ playing with while loops -------------- //
var ran = 0
while ran < 4 {
    ran = Int(arc4random() % 5)
}

var running: Int
repeat {
    running = Int(arc4random() % 5)
} while running < 4


// ------------ playing with switch statments -------------- //
var speed = 30_000_000
switch speed {
case 30_000_000:
    print("Speed of light")
case 360:
    print("Speed of sound")
default:
    print("nothing matched")
}

var vowel = "i"
switch vowel {
case "a","e","i","o","u":
    print("this is a vowel")
default:
    print("this is something else")
}

var currentHeat = 46
var locationHeat = "Garden"
switch currentHeat {
case 0...35:
    print("it's a nice temp")
case 35...69  where locationHeat != "Garden":
    print("It's getting kinda hot!")
case 35...69 where locationHeat == "Garden":
    print("It's getting kinda hot, but it's OK because we're in the garden")
case 69...100:
    print("jesus im cooking")
default:
    print("something weird happened")
}


// ------------ playing with case statments -------------- //
let numOption = [1,2,nil,5,6,68]

for num in numOption {
    if let num = num {
        if num > 3 {
            print(num)
        }
    }
}

for case let num? in numOption where num > 3 {
    print(num)
}


enum identiFi {
    case Name(String)
    case Age(Int)
    case Gender(String)
    case DoB(String)
}

var personAge = identiFi.Age(28)

if case let .Age(age) = personAge {
    print("The age is \(age)")
}


if case let .Age(age) = personAge, age == 28 {
    print("the age is again \(age)")
}


// ------------ playing with control transfer statements -------------- //
for i in 1...10 {
    if i % 2 != 0 {
        continue
    }
    print("an even number is \(i)")
}

for i in 1...10 {
    if i % 2 == 0 {
        break
    }
    print("an odd number is \(i)")
}

func guardFunction(Str: String?) {
    guard let goodStr = Str else {
        print("Input was nil")
        return
    }
    print("Input was \(goodStr)")
}
guardFunction(Str: "Hello world")


// ------------ playing with functions -------------- //
func functionPlay(name: String) -> Void {
    let retStringPlay = "Hello " + name
    print(retStringPlay)
}

func functionHello(name: String) -> Int {
    return name.characters.count
}

functionPlay(name: "Bobby")
print(functionHello(name: "Chris"))


var buyMore = ""
func functionDefault(name: String, fruit: String = "Bananas", quantity: Int) -> Void {
    if quantity < 3 {
        buyMore = " You should maybe buy some more?"
    }
    print("Your name is \(name) and you love \(fruit), but only have \(quantity) left.\(buyMore)")
}

functionDefault(name: "David", quantity: 5)
functionDefault(name: "Pauline", fruit: "Oranges", quantity: 2)


func functionTuple(name: String = "Chris") -> (name: String, height: Double, age: Int) {
    let personTuple = (name, 6.2, 28)
    return personTuple
}

var funcResults = functionTuple()
var funcResultsOverride = functionTuple(name: "Jimmy")
print("Hello \(funcResults.name), you are \(funcResults.height) tall and \(funcResults.age) years old")
print("You also have a mate called \(funcResultsOverride.name).")


func sayHello(sayGreeting greeting: String = "Hey", toName name: String...) {
    for each in name {
        print("\(greeting) \(each)")
    }
}

var classNames = ["Chris", "Sally", "Hayley", "Pauline", "David"]
for name in classNames {
    sayHello(toName: name)
}


func sort(numbers: inout [Int]) {
    func reverse(first: inout Int, second: inout Int) {
        let tmp = first
        first = second
        second = tmp
    }
    
    var count = numbers.count
    while count > 0 {
        for var i in 1..<count {
            if numbers[i] < numbers[i-1] {
                reverse(first: &numbers[1], second: &numbers[i-1])
            }
        }
        count -= 1
    }
}

var nums = [6,3,2,4,5,6]

sort(numbers: &nums)

for value in nums {
    print("--\(value)")
}


// ------------ combining everything -------------- //

func checkIPAddress(IPAddressToCheck ipaddress: String?) -> Bool {
    
    guard let ipaddress = ipaddress else {
        return false
    }
    
    let octets = ipaddress.characters.split{ $0 == "." }.map{ String($0) }
    guard octets.count == 4 else {
        return false
    }
    
    func validOctet (octet: String) -> Bool {
        guard let num = Int (String(octet)), num >= 0 && num < 256 else {
            return false
        }
        return true
    }
    for octet in octets {
        guard validOctet(octet: octet) else {
            return false
        }
    }
    
    return true
    
}

checkIPAddress(IPAddressToCheck: "192.168.0.1")






