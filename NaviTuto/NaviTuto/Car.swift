//
//  Car.swift
//  NaviTuto
//
//  Created by 이승준 on 2023/07/25.
//

import SwiftUI

struct Car: Codable, Identifiable {
    var id: String
    var name: String
    
    var description: String
    var isHybrid: Bool
    
    var imageName: String
}
