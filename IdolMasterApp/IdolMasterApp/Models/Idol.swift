//
//  IdolData.swift
//  IdolMasterApp
//
//  Created by 신희권 on 2023/07/03.
//

import Foundation

protocol Idol: Identifiable {
    var id: UUID { get }
    var name: String { get set }
    var company: String { get set }
    var memberNumbers : Int { get set}
    var image: String { get set}
    var debut: String { get set}
    var gender: String { get set}
    var memberName: [String] { get set}
    
}
