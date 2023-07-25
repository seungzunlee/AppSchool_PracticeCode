//
//  CelsiusViewController.swift
//  Counter
//
//  Created by 이승준 on 2023/07/19.
//

import UIKit

class CelsiusViewController: UIViewController {
    
    lazy var inputNumber: UITextField = {
        let textField = UITextField()
        textField.placeholder = "온도를 입력하세요"
        textField.borderStyle = .roundedRect
        
        return textField
    }()
    
    lazy var resultButton: UIButton = {
        let button = UIButton(configuration: .plain())
        button.setTitle("화씨로 변환", for: .normal)
        //기본색상 흰색
        button.setTitleColor(.black, for: .normal)
        //눌렸을때 색깔
        button.tintColor = .darkGray
        //보더 설정
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 5
        return button
    }()
    
    lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.text = "결과"
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        [inputNumber, resultButton, resultLabel].forEach { item in
            view.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            inputNumber.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            inputNumber.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            resultButton.topAnchor.constraint(equalTo: inputNumber.bottomAnchor, constant: 50),
            resultButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            resultLabel.topAnchor.constraint(equalTo: resultButton.bottomAnchor, constant: 50),
            resultLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
        
        resultButton.addTarget(self, action: #selector(calcTemp), for: .touchUpInside)
    }
    
    @objc func calcTemp() {
        guard let inputNum = Double(inputNumber.text!) else { return }
        
        let result : Double = inputNum * 1.8 + 32
        
        resultLabel.text = String(result) + "°F"
    }
}
