import UIKit

// ------------ playing with structure -------------- //
struct EmployeeStruct {
    var firstName = ""
    var lastName = ""
    
    var salaryYear: Double = 0.0 {
        willSet {
            print("About to set salaryYear to \(newValue)")
        }
        didSet {
            if salaryWeek > oldValue {
                print("\(firstName) got a raise")
            } else  {
                print("\(firstName) did not get a raise")
            }
        }
    }
    
    var salaryWeek: Double {
        get {
            return self.salaryYear / 52
        }
        set {
            self.salaryYear = newValue * 52
        }
    }

    func getFullName() -> String {
        return firstName + " " + lastName
    }
    
    mutating func giveRaise(amount: Double) {
        self.salaryYear += amount
    }

}

var employeeS = EmployeeStruct(firstName: "Ben", lastName: "Dover", salaryYear: 12000)
print(employeeS.salaryWeek)

employeeS.salaryWeek = 1000

print(employeeS.salaryWeek)
print(employeeS.salaryYear)


// ------------ playing with classes -------------- //
public class EmployeeClass {
    var firstName = ""
    var lastName = ""

    var salaryYear: Double = 0.0 {
        willSet (newSalary) {
            print("About to set salaryYear to \(newSalary)")
        }
        didSet {
            if salaryWeek > oldValue {
                print("\(firstName) got a raise")
            } else {
                print("\(firstName) did not get a raise")
            }
        }
    }
    
    var salaryWeek: Double {
        get {
            return self.salaryYear / 52
        }
        set (newSalaryWeek) {
            self.salaryYear = newSalaryWeek * 52
        }
    }

    func getFullName() -> String {
        return firstName + " " + lastName
    }
    
    func giveRaise(amount: Double) {
        self.salaryYear += amount
    }
    
    
    init() {
        self.firstName = ""
        self.lastName = ""
        self.salaryYear = 0.0
    }
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.salaryYear = 0.0
    }
    
//    init(firstName: String, lastName: String, salaryYear: Double) {
//        self.firstName = firstName
//        self.lastName = lastName
//        self.salaryYear = salaryYear
//    }
    
    init?(firstName: String, lastName: String, salaryYear: Double) {
        self.firstName = firstName
        self.lastName = lastName
        self.salaryYear = salaryYear
        if self.salaryYear < 30000 {
            return nil
        }
    }
    
}


var employeeCl = EmployeeClass()
var employeeC = EmployeeStruct(firstName: "Ballin", lastName: "Dep", salaryYear: 60000)

employeeCl.firstName = "John"
employeeCl.lastName = "Digin"
employeeCl.salaryYear = 50000

employeeCl.giveRaise(amount: 75000)
employeeC.giveRaise(amount: 1100)

print(employeeCl.getFullName())
print(employeeC.getFullName())

print(employeeC.salaryYear)


if let failTest = EmployeeClass(firstName: "Fred", lastName: "Finger", salaryYear: 29000) {
    print("Your salary is above avarage")
} else {
    print("You need a raise")
}


// ------------ playing with inheritance -------------- //
class Plant {
    var height = 0.0
    var age = 0.0
    func growHeight(inches: Double) {
        self.height += inches
    }
    func getDetails() -> String {
        return "Height: \(height) Age: \(age)"
    }
    var description: String {
        get {
            return "Base class is Plant."
        }
    }
}

class Tree: Plant {
    var limbs = 0
    func limbGrow() {
        self.limbs += 1
    }
    func limbFall() {
        self.limbs -= 1
    }
    override func getDetails() -> String {
        let details = super.getDetails()
        return "\(details) Limbs: \(limbs)"
    }
    override var description: String {
        return "\(super.description) I am the Tree class."
    }
}

final class PineTree: Tree {
    var needles = 0
}

final class OakTree: Tree {
    var leaves = 0
    override func getDetails() -> String {
        let details = super.getDetails()
        return "\(details) Leaves: \(leaves)"
    }
}

var tree = OakTree()
tree.age = 5
tree.height = 4
tree.leaves = 50
tree.limbGrow()
tree.limbGrow()

print(tree.getDetails())
print(tree.description)


// ------------ playing with protocal -------------- //

protocol FullName {
    var firstName: String {get set}
    var lastName: String {get set}
    func getFullName() -> String
}

class Scientist: FullName {
    var firstName = ""
    var lastName = ""
    var field = ""
    
    func getFullName() -> String {
        return "\(firstName) \(lastName) studies \(field)"
    }
}

class FootballPlayer: FullName {
    var firstName = ""
    var lastName = ""
    var number = 0
    
    func getFullName() -> String {
        return "\(firstName) \(lastName) has the number \(number)"
    }
}

var scientist = Scientist()
scientist.firstName = "Bob"
scientist.lastName = "Deepin"
scientist.field = "Physics"

var player = FootballPlayer()
player.firstName = "Dan"
player.lastName = "Yelo"
player.number = 9

var person: FullName

person = scientist
print(person.getFullName())

person = player
print(person.getFullName())


// ------------ playing with extensions -------------- //
extension String {
    var firstLetter: Character? {
        get {
            return self.characters.first
        }
    }
    func reverse() -> String {
        var reverse = ""
        for letter in self.characters {
            reverse = "\(letter)" + reverse
        }
        return reverse
    }
}

var myString = "Learning Swift is Fun"
print(myString.reverse())
print(myString.firstLetter!)


// ------------ playing with memory / ARC -------------- //
class ArcMemory {
    var name = ""
    init(name: String) {
        self.name = name
        print("Init class with name \(self.name)")
    }
    deinit {
        print("Released class with name \(self.name)")
    }
}

var class1ref1: ArcMemory? = ArcMemory(name: "One")
var class2ref1: ArcMemory? = ArcMemory(name: "Two")
var class2ref2: ArcMemory? = class2ref1

print("Setting class1ref1 to nil")
class1ref1 = nil

print("Setting class2ref1 to nil")
class2ref1 = nil

print("Settings class2ref2 to nil")
class2ref2 = nil

var classInit = EmployeeClass(firstName: "Joe", lastName: "Done")
