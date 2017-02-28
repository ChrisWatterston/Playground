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
    
    init(firstName: String, lastName: String, salaryYear: Double) {
        self.firstName = firstName
        self.lastName = lastName
        self.salaryYear = salaryYear
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


// ------------ playing with initializers -------------- //

var classInit = EmployeeClass(firstName: "Joe", lastName: "Done")
