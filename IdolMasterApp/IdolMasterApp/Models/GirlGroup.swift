//
//  GirlGroup.swift
//  IdolMasterApp
//
//  Created by 신희권 on 2023/07/03.
//

import Foundation

class GirlGroup: Idol {
    var id: UUID = UUID()
    var name: String
    var company: String
    var memberNumbers : Int
    var image: String
    var debut: String
    var gender: String
    var memberName: [String]
    var isQueenDom: Bool
    
    
    init(name: String, company: String, memberNumbers: Int, image: String, debut: String, gender: String,memberName: [String], isQueenDom: Bool) {
        self.name = name
        self.company = company
        self.memberNumbers = memberNumbers
        self.image = image
        self.debut = debut
        self.gender = gender
        self.memberName = memberName
        self.isQueenDom = isQueenDom
    }
    
    
}
