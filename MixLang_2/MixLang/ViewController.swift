//
//  ViewController.swift
//  MixLang
//
//  Created by yunjikim on 2023/07/13.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var numberTextField1: UITextField!
    
    @IBOutlet weak var numberTextField2: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    let calc: MixCalc = MixCalc()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Objective-C로 만든 클래스 MixCalc를 사용하려면 브릿지에서 헤더파일을 임포트 해주어야 한다.
        // MixCalc는 참조 타입인 클래스로 선언되어서 let으로 만든 존재에 할당해서 그 위치만 계속 알려줘도 내용은 활용할 수 있다.(추가, 삭제 등)
        
        let greeting: String = calc.greetingMessage()
        print("\(greeting)")
        
    }
    
    @IBAction func pressPlusButton(_ sender: UIButton) {
        var title = sender.titleLabel?.text ?? ""
        
        let number1:Int = Int(numberTextField1.text ?? "") ?? 0
        let number2: Int = Int(numberTextField2.text ?? "") ?? 0
        
        var plusResult: Int = 0
        
        switch title {
        case "plus":
            plusResult = Int(calc.plus(Int32(number1), with: Int32(number2)))
        case "minus":
            plusResult = Int(calc.minus(Int32(number1), with: Int32(number2)))
        case "multiply":
            plusResult = Int(calc.multiply(Int32(number1), with: Int32(number2)))
        case "divide":
            plusResult = Int(calc.divide(Int32(number1), with: Int32(number2)))
        default:
            return
        }
        
        resultLabel.text = "\(plusResult)"
        
    }
    

}

