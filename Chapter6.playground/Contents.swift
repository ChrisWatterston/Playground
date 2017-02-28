import UIKit


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
    var myPerson: PersonProtocal
    var people: [PersonProtocal] = []
    
    
    return person
}


// ------------ playing with Protocal Extentions -------------- //
protocol DogProtocal {
    var name: String {get set}
    var colour: String {get set}
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
}

struct Mutt: DogProtocal {
    var name: String
    var colour: String
}






