//
//  ViewController.swift
//  Counter
//
//  Created by 이승준 on 2023/07/19.
//

import UIKit

class FirstViewController: UIViewController {
    
    var resultLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        
        
        return label
    }()
    
    var plusOneButton: UIButton = {
        let button = UIButton(configuration: .plain())
        button.setTitle("+1", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.tintColor = .red

        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 5
        button.layer.cornerRadius = 5

        return button
    }()
    
//    var plusTwoButton: UIButton = {
//        let button = UIButton(configuration: .plain())
//        button.setTitle("+2", for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        button.tintColor = .red
//
//        button.layer.borderColor = UIColor.black.cgColor
//        button.layer.borderWidth = 5
//        button.layer.cornerRadius = 5
//
//        return button
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        
        let safeArea = view.safeAreaLayoutGuide
        
        [resultLabel, plusOneButton].forEach { item in
            view.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
     
        NSLayoutConstraint.activate([
        
            resultLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 200),
            resultLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            
            plusOneButton.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 50),
            plusOneButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
        ])
        
        plusOneButton.addTarget(self, action: #selector(plusOne), for: .touchUpInside)
    }

    @objc func plusOne() {
        guard let inputNumber = Int(resultLabel.text!) else { return }
        
        let result: Int = inputNumber + 1
        
        resultLabel.text = String(result)
    }

}

