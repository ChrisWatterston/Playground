//
//  ViewController.swift
//  Calculator
//
//  Created by Chris Watterston on 29/12/2016.
//  Copyright © 2016 Chris Watterston. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var display: UILabel!
    
    private var userIsInTheMiddleOfTyping = false
    
    @IBAction private func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
        }
        userIsInTheMiddleOfTyping = true
    }
    
    private var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    
    var savedProgram: CalculatorBrain.PropertyList?
    
    @IBAction func save(_ sender: Any) {
        savedProgram = brain.program
    }
    
    @IBAction func restore(_ sender: Any) {
        if savedProgram != nil {
            brain.program = savedProgram!
            displayValue = brain.result
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction private func performOpo(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(operand: displayValue)
            userIsInTheMiddleOfTyping = false
        }

        userIsInTheMiddleOfTyping = false
        if let mathSymbol = sender.currentTitle {
            brain.performOperation(symbol: mathSymbol)
        }
        displayValue = brain.result
    }
    
    @IBAction func clear(_ sender: Any) {
        brain.clearCalcOper()
        display.text = " "
    }
    
    @IBAction func showDesc() {
        let discriptionStr = brain.descriptionOps
        
        print(discriptionStr)
    }
    
    func isPartialResult() {
        let PartialResultBool = brain.isBinaryInProgress
        
        if PartialResultBool == true {
            print("true")
        } else {
            print("false")
        }
        
    }
    
    
}

