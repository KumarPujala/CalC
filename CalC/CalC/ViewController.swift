//
//  ViewController.swift
//  CalC
//
//  Created by Kumar Pujala on 22/12/20.
//  Copyright © 2020 Kumar Pujala. All rights reserved.
//

import UIKit

enum Operation:String{
    case Add = "+"
    case Subtract = "-"
    case Divide = "/"
    case Multiply = "*"
    case NULL = "Null "
}
class ViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!
    
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperation:Operation = .NULL
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outputLabel.text = "0"
    }
  
     
    @IBAction func numberPressed(_ sender: RoundButton) {
        if runningNumber.count <= 8{
            runningNumber += "\(sender.tag)"
            outputLabel.text = runningNumber
        }
    }
    @IBAction func allClearPressed(_ sender: RoundButton) {
        runningNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperation = .NULL
        outputLabel.text = "0"
    }
    @IBAction func dotPresses(_ sender: RoundButton) {
        if runningNumber.count <= 7{
            runningNumber += "."
            outputLabel.text = runningNumber
        }
    }
    @IBAction func equalPressed(_ sender: RoundButton) {
        operation(operation: currentOperation)
    }
    @IBAction func addPressed(_ sender: RoundButton) {
        operation(operation: .Add)
    }
    @IBAction func minusPressed(_ sender: RoundButton) {
        operation(operation: .Subtract)
    }
    @IBAction func mulPressed(_ sender: RoundButton) {
        operation(operation: .Multiply)
    }
    @IBAction func dividePressed(_ sender: RoundButton) {
        operation(operation: .Divide)
    }
    func operation(operation:Operation){
        if currentOperation != .NULL{
            if runningNumber != ""{
                rightValue = runningNumber
                runningNumber = ""
                
                if currentOperation == .Add{
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                }else if currentOperation == .Subtract{
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                }else if currentOperation == .Multiply{
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                }else if currentOperation == .Divide{
                    result = "\(Double(leftValue)! / Double(rightValue)!)"
                }
                leftValue = result
                if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0){
                    result = "\(Int(Double(result)!))"
                }
                outputLabel.text = result
            }
            currentOperation = operation
        }else {
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
}

