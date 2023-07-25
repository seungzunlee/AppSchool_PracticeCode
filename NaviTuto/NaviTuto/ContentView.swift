//
//  ContentView.swift
//  NaviTuto
//
//  Created by 이승준 on 2023/07/25.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var carStore: CarStore = CarStore(cars: carData)
    @State var isAddNewCar: Bool = false
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(carStore.cars) { car in
                    ListCell(car: car)
                }
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
            }
            .navigationTitle("EV Cars")
            
            // 최신기술
            .navigationDestination(isPresented: $isAddNewCar) {
                AddNewCarView(carStore: self.carStore, isAddNewCar: $isAddNewCar)
                      }
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isAddNewCar = true
                    } label: {
                        Text("Add")
                    }


                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        }
    }

    func deleteItems(at offsets: IndexSet) {
        carStore.cars.remove(atOffsets: offsets)
    }
    func moveItems(from source: IndexSet, to destination: Int) {
        carStore.cars.move(fromOffsets: source, toOffset: destination)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ContentView()
        }
    }
}

struct ListCell: View {
    
    var car: Car
    
    var body: some View {
        NavigationLink(destination: CarDetailView(selectedCar: car)) {
            HStack {
                Image(car.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 60)
                Text(car.name)
            }
        }
    }
}
