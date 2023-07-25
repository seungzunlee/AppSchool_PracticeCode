//
//  AddNewCarView.swift
//  NaviTuto
//
//  Created by 이승준 on 2023/07/25.
//

import SwiftUI

struct AddNewCarView: View {
    
    @ObservedObject var carStore: CarStore
    
    @State var isHybrid = false
    @State var name: String = ""
    @State var description: String = ""
    @Binding var isAddNewCar: Bool
    
    var body: some View {
        Form {
            Section("Car Details") {
                Image(systemName: "car.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(5)
                DataInput(title: "Model", userInput: $name)
                DataInput(title: "Description", userInput: $description)
                
                Toggle(isOn: $isHybrid) {
                    Text("Hybrid")
                        .font(.headline)
                }
                .padding(5)
            }
            Button {
                addNewCar()
                isAddNewCar = false
            } label: {
                Text("Add Car")
            }
        }
    }
    func addNewCar() {
        let newCar = Car(id: UUID().uuidString, name: name, description: description, isHybrid: isHybrid, imageName: "tesla_model_3")
        carStore.cars.append(newCar)
    }
}

struct DataInput: View {
    
    var title: String
    @Binding var userInput: String
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

struct AddNewCarView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewCarView(carStore: CarStore (cars: carData), isAddNewCar: .constant(true))
    }
}
