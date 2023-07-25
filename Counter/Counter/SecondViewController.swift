//
//  SecondViewController.swift
//  Counter
//
//  Created by 이승준 on 2023/07/19.
//

import UIKit

class SecondViewController: UIViewController {
    
    var resultLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        
        
        return label
    }()
        
    var plusTwoButton: UIButton = {
        let button = UIButton(configuration: .plain())
        button.setTitle("+2", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.tintColor = .red

        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 5
        button.layer.cornerRadius = 5

        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        let safeArea = view.safeAreaLayoutGuide
        
        [resultLabel, plusTwoButton].forEach { item in
            view.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
     
        NSLayoutConstraint.activate([
        
            resultLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 200),
            resultLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            
            plusTwoButton.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 50),
            plusTwoButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
        ])
        
        plusTwoButton.addTarget(self, action: #selector(plusTwo), for: .touchUpInside)
    }

    @objc func plusTwo() {
        guard let inputNumber = Int(resultLabel.text!) else { return }
        
        let result: Int = inputNumber + 2
        
        resultLabel.text = String(result)
    }

}
