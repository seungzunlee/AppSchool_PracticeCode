//
//  CarDetailView.swift
//  NaviTuto
//
//  Created by 이승준 on 2023/07/25.
//

import SwiftUI

struct CarDetailView: View {
    
    let selectedCar: Car
    
    var body: some View {
        Form {
            Section("Car Details") {
                Image(selectedCar.imageName)
                    .resizable()
                    .cornerRadius(15.0)
                    .aspectRatio(contentMode: .fill)
                    .padding(5)
                
                
                Text(selectedCar.name)
                    .font(.headline)
                
                Text(selectedCar.description)
                    .font(.body)
                
                HStack {
                    Text("Hybrid")
                        .font(.headline)
                    Spacer()
                    Image(systemName: selectedCar.isHybrid ? "checkmark.circle" : "xmark.circle")
                }
            }
        }
    }
}

struct CarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CarDetailView(selectedCar: carData[0])
    }
}
