//
//  ShoppingItemStore.swift
//  ShoppingList
//
//  Created by 아라 on 2023/08/04.
//

import Foundation

@MainActor
class ItemStore: ObservableObject {
    @Published var products : [Item] = []
    @Published var cartItems: [Item] = []
    @Published var fetchResults: String = ""
    
    
    init() {
//        products = [
//            Item(id: "p1", name: "삼성전자 갤럭시 Z 플립5 5G 자급제 SM-F731N", imageUrlString: "https://images.samsung.com/kdp/event/sec/2023/0801_galaxy_flip5/preorder/buying/slide/flip5_buying_default01_pc.png", price: 1289000, shoppingName: "Coupang", shoppingUrlString: "https://www.coupang.com/vp/products/7410157624?itemId=19197972081&vendorItemId=86315402641&q=%ED%95%B8%EB%93%9C%ED%8F%B0&itemsCount=36&searchId=cc5372605ae348519b0819e0682c0bf0&rank=0&isAddedCart=")
//        ]
    }
    
    func addItem(item: Item) {
        cartItems.append(item)
    }
    
    func deleteItem(at offsets: IndexSet){
        cartItems.remove(atOffsets: offsets)
    }
    
    func fetchProducts() async {
        
        //https://mocki.io/v1/62e5d7f3-ccc4-40a2-9af9-53962184570c
        
        let urlString: String = "https://mocki.io/v1/62e5d7f3-ccc4-40a2-9af9-53962184570c"
        
        guard let url = URL(string: urlString) else {
            print("Wrong URL")
            return
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            print("\(response)")
            
            let jsonString = String(data: data, encoding: .utf8)
            print("\(jsonString ?? "")")
            
            products = try JSONDecoder().decode([Item].self, from: data)
            
            fetchResults = ""
        } catch {
            debugPrint("--------")
            debugPrint("Error loading \(url):")
            debugPrint("\(String(describing: error))")
            debugPrint("--------")
            
            fetchResults = "상품정보 읽기 실패했습니다"
        }
    }
}
