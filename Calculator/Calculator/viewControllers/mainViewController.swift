//
//  mainViewController.swift
//  Calculator
//
//  Created by Daddy on 01/10/2024.
//

import UIKit

class mainViewController: UIViewController {
    var numberBeforeOpp: String!
    var fullOpp: String!
    var pursedOpp: String!
    var isResultShown: Bool = false
    
    @IBOutlet weak var numberViwer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberBeforeOpp = ""
        fullOpp = ""
        pursedOpp = ""
    }
    
    func resetIfResultShown() {
        if isResultShown {
            numberViwer.text = "0"
            fullOpp = ""
            isResultShown = false
        }
    }
    
    @IBAction func btn7Tapped(_ sender: Any) {
        resetIfResultShown()
        if numberViwer.text == "0" {
            numberViwer.text! = "7"
        } else {
            numberViwer.text! += "7"
        }
    }
    
    @IBAction func btn8Tapped(_ sender: Any) {
        resetIfResultShown()
        if numberViwer.text == "0" {
            numberViwer.text! = "8"
        } else {
            numberViwer.text! += "8"
        }
    }
    
    @IBAction func btn9Tapped(_ sender: Any) {
        resetIfResultShown()
        if numberViwer.text == "0" {
            numberViwer.text! = "9"
        } else {
            numberViwer.text! += "9"
        }
    }
    
    @IBAction func btn4Tapped(_ sender: Any) {
        resetIfResultShown()
        if numberViwer.text == "0" {
            numberViwer.text! = "4"
        } else {
            numberViwer.text! += "4"
        }
    }
    
    @IBAction func btn5Tapped(_ sender: Any) {
        resetIfResultShown()
        if numberViwer.text == "0" {
            numberViwer.text! = "5"
        } else {
            numberViwer.text! += "5"
        }
    }
    
    @IBAction func btn6Tapped(_ sender: Any) {
        resetIfResultShown()
        if numberViwer.text == "0" {
            numberViwer.text! = "6"
        } else {
            numberViwer.text! += "6"
        }
    }
    
    @IBAction func btn1Tapped(_ sender: Any) {
        resetIfResultShown()
        if numberViwer.text == "0" {
            numberViwer.text! = "1"
        } else {
            numberViwer.text! += "1"
        }
    }
    
    @IBAction func btn2Tapped(_ sender: Any) {
        resetIfResultShown()
        if numberViwer.text == "0" {
            numberViwer.text! = "2"
        } else {
            numberViwer.text! += "2"
        }
    }
    
    @IBAction func btn3Tapped(_ sender: Any) {
        resetIfResultShown()
        if numberViwer.text == "0" {
            numberViwer.text! = "3"
        } else {
            numberViwer.text! += "3"
        }
    }
    
    @IBAction func btn0Tapped(_ sender: Any) {
        resetIfResultShown()
        if numberViwer.text == "0" {
            numberViwer.text! = "0"
        } else {
            numberViwer.text! += "0"
        }
    }
    
    @IBAction func btnDotTapped(_ sender: Any) {
        resetIfResultShown()
        if numberViwer.text?.contains(".") == false {
            numberViwer.text! += "."
        }
    }
    
    @IBAction func btnCleatTapped(_ sender: Any) {
        numberViwer.text = "0"
        fullOpp = ""
        isResultShown = false
    }
    
    @IBAction func divideBtnTapped(_ sender: Any) {
        resetIfResultShown()
        numberBeforeOpp = numberViwer.text
        fullOpp += numberBeforeOpp
        numberViwer.text = ""
        fullOpp += "÷"
    }
    
    @IBAction func multiplyBtnTapped(_ sender: Any) {
        resetIfResultShown()
        numberBeforeOpp = numberViwer.text
        fullOpp += numberBeforeOpp
        numberViwer.text = ""
        fullOpp += "×"
    }
    
    @IBAction func minusBtnTapped(_ sender: Any) {
        resetIfResultShown()
        numberBeforeOpp = numberViwer.text
        fullOpp += numberBeforeOpp
        numberViwer.text = ""
        fullOpp += "-"
    }
    
    @IBAction func plusBtnTapped(_ sender: Any) {
        resetIfResultShown()
        numberBeforeOpp = numberViwer.text
        fullOpp += numberBeforeOpp
        numberViwer.text = ""
        fullOpp += "+"
    }
    
    @IBAction func backspaceTapped(_ sender: Any) {
        if var text = numberViwer.text, !text.isEmpty {
            text.removeLast()
            if text.isEmpty {
                numberViwer.text = "0"
            } else {
                numberViwer.text = text
            }
        }
    }

    @IBAction func equlaBtnTapped(_ sender: Any) {
        fullOpp += numberViwer.text ?? ""
        print("Full Operation: \(fullOpp ?? "")")
        
        if let result = evaluateMathExpression(expression: fullOpp) {
            if result.truncatingRemainder(dividingBy: 1) == 0 {
                numberViwer.text = "\(Int(result))"
            } else {
                numberViwer.text = "\(result)"
            }
            isResultShown = true
        } else {
            numberViwer.text = "Error"
            isResultShown = true
        }
        
        fullOpp = ""
    }

    
    func evaluateMathExpression(expression: String) -> Double? {
        let modifiedExpression = expression.replacingOccurrences(of: "÷", with: "/")
                                            .replacingOccurrences(of: "×", with: "*")
        
        let exp = NSExpression(format: modifiedExpression)
        
        if let result = exp.expressionValue(with: nil, context: nil) as? Double {
            return result
        }
        
        return nil
    }
}
