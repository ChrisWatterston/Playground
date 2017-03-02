//
//  ViewController.swift
//  Chapter8
//
//  Created by Chris Watterston on 02/03/2017.
//  Copyright © 2017 Chris Watterston. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }

}

enum MyError: Error {
    case Minor
    case Bad
    case Terrible (description: String)
}

enum PlayerNumberError: Error {
    case NumberTooHight (description: String)
    case NumberTooLow (description: String)
    case NumberAlreadyAssigned
    case NumberDoesNotExist
}

struct BaseballTeam {
    var players = [String: Int]()
    
    typealias BaseballPlayer = (firstName: String, lastName: String, number: Int)
    
    var maxNumber = 35
    var minNumber = 5
    
    mutating func addPlayer(player: BaseballPlayer) throws {
        guard player.number < maxNumber else {
            throw PlayerNumberError.NumberTooHight(description: "Max number is \(maxNumber)")
        }
        guard player.number > minNumber else {
            throw PlayerNumberError.NumberTooLow(description: "Min number is \(minNumber)")
        }
        guard players[player.number] == nil else {
            throw PlayerNumberError.NumberAlreadyAssigned
        }
        players[player.number] = player
    }
    
    func getPlayerByNumber(number: Int) throws -> BaseballPlayer {
        if let player = players[number] {
            return player
        } else {
            throw PlayerNumberError.NumberDoesNotExist
        }
        
    }
    
    
}
