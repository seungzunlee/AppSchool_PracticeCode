//
//  CarStore.swift
//  NaviTuto
//
//  Created by 이승준 on 2023/07/25.
//

import SwiftUI
import Combine

class CarStore: ObservableObject {
    @Published var cars: [Car]
    
    init(cars: [Car] = []) {
        self.cars = cars
    }
}
