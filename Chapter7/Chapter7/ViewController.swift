//
//  ViewController.swift
//  Chapter7
//
//  Created by Chris Watterston on 01/03/2017.
//  Copyright © 2017 Chris Watterston. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        var animals = [Animal]()
        
        let an1 = Alligator()
        let an2 = Alligator()
        let an3 = Lion()
        
        animals.append(an1)
        animals.append(an2)
        animals.append(an3)
        
        for (index, animal) in animals.enumerated() {
            if let animal = animal as? AirAnimal {
                print("Animal at \(animal.name) is Air - \(index)")
            }
            if let animal = animal as? LandAnimal {
                print("Animal at \(animal.name) is Land - \(index)")
            }
            if let animal = animal as? SeaAnimal {
                print("Animal at \(animal.name) is Sea - \(index)")
            }
        }
        

        
        let activeOOP = Programmer(firstName: "Jim", lastName: "Inner", age: 24, hairColour: "Red", height: 6.2, occupationName: "Designer", yearlySalary: 23000, experienceYears: 10)
        print("My names \(activeOOP.firstName) \(activeOOP.lastName). I'm a \(activeOOP.age) with \(activeOOP.hairColour) hair and \(activeOOP.height) tall. I'm a \(activeOOP.occupationName) earning \(activeOOP.yearlySalary) annually, with \(activeOOP.experienceYears) years experience.")
    
    }
}


protocol Name {
    var firstName: String {get set}
    var lastName: String {get set}
}
protocol Age {
    var age: Int {get set}
}
protocol Fur {
    var furColour: String {get set}
}
protocol Hair {
    var hairColour: String {get set}
}
protocol Occupation {
    var occupationName: String {get set}
    var yearlySalary: Double {get set}
    var experienceYears: Double {get set}
}


protocol Person: Name, Age, Hair {
    var height: Double {get set}
}
protocol Dog: Name, Age, Fur {
    var breed: String {get set}
}

struct Programmer: Person, Occupation {
    var firstName: String
    var lastName: String
    var age: Int
    var hairColour: String
    var height: Double
    var occupationName: String
    var yearlySalary: Double
    var experienceYears: Double
}





protocol Animal {
    var hitPoints: Int {get set}
    var name: String {get set}
}

extension Animal {
    mutating func takeHit(amount: Int) { hitPoints -= amount }
    func hitPointsRemaining() -> Int { return hitPoints }
    func isAlive() -> Bool { return hitPoints > 0 ? true : false }
}

protocol LandAnimal: Animal {
    var landAttack: Bool {get}
    var landMovement: Bool {get}
    func doLandAttack()
    func doLandMovement()
}
protocol SeaAnimal: Animal {
    var seaAttack: Bool {get}
    var seaMovement: Bool {get}
    func doSeaAttack()
    func doSeaMovement()
}
protocol AirAnimal: Animal {
    var airAttack: Bool {get}
    var airMovement: Bool {get}
    func doAirAttack()
    func doAirMovement()
}

struct Lion: LandAnimal {
    var name = "Lion"
    var hitPoints = 20
    let landAttack = true
    let landMovement = true
    func doLandAttack() {
        print("Lion Attack")
    }
    func doLandMovement() {
        print("Lion Move")
    }
}

struct Alligator: LandAnimal, SeaAnimal {
    var name = "Alligator"
    var hitPoints = 35
    let landAttack = true
    let landMovement = true
    let seaAttack = true
    let seaMovement = true
    func doLandAttack() {
        print("Alligator Land Attack")
    }
    func doLandMovement() {
        print("Alligator Land Move")
    }
    func doSeaAttack() {
        print("Alligator Sea Attack")
    }
    func doSeaMovement() {
        print("Alligator Sea Move")
    }
}





















