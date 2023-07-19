//
//  ViewController.swift
//  Temperature
//
//  Created by 방유빈 on 2023/07/19.
//

import UIKit

class ViewController: UIViewController {
    //텍스트 필드 생성
    lazy var inputNumber: UITextField = {
        //클로저안에서 미리 속성들을 초기화하여 생성
        let textField = UITextField()
        //자리표시자
        textField.placeholder = "온도를 입력해주세요."
        //보더있는 텍스트필드
        textField.borderStyle = .roundedRect
        return textField
    }()
    //변환 버튼
    lazy var resultButton:UIButton = {
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
    var resultButton2:UIButton = {
        //configuration -> 버튼 스타일 설정
        let button = UIButton(configuration: .plain())
        button.setTitle("섭씨로 변환", for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        button.layer.borderColor = UIColor.black.cgColor
//        button.layer.borderWidth = 2
//        button.layer.cornerRadius = 5
        
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
        // Do any additional setup after loading the view.
        //addsubview,translatesAutoresizingMaskIntoConstraints 한번에 하기
        [inputNumber, resultButton, resultLabel, resultButton2].forEach {item in
            view.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            //텍스트 필드
            inputNumber.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            inputNumber.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            //버튼
            resultButton.topAnchor.constraint(equalTo: inputNumber.bottomAnchor, constant: 50),
            resultButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            resultButton2.topAnchor.constraint(equalTo: resultButton.topAnchor),
            resultButton2.leadingAnchor.constraint(equalTo: resultButton.trailingAnchor, constant: 20),
            resultButton2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            resultButton2.widthAnchor.constraint(equalTo: resultButton.widthAnchor),
            
            //Label
            resultLabel.topAnchor.constraint(equalTo: resultButton.bottomAnchor, constant: 50),
            resultLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
        
        //액션 함수 추가
        resultButton.addTarget(self, action: #selector(calcTemp), for: .touchUpInside)
        resultButton2.addTarget(self, action: #selector(calcTemp2), for: .touchUpInside)
    }
    
    @objc func calcTemp(){
        guard let inputNum = Double(inputNumber.text!) else { return }
        
        let result : Double = inputNum * 1.8 + 32
        
        resultLabel.text = String(result) + "°F"
    }
    @objc func calcTemp2(){
        guard let inputNum = Double(inputNumber.text!) else { return }
        
        let result : Double = (inputNum - 32) / 1.8
        
        resultLabel.text = String(result) + "°C"
    }
}

