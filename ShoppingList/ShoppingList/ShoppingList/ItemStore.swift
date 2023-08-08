//
//  ShoppingItemStore.swift
//  ShoppingList
//
//  Created by 아라 on 2023/08/04.
//

import Foundation

class ItemStore: ObservableObject {
    @Published var products : [Item] = []
    @Published var cartItems: [Item] = []
//    @Published var fetchResults: String = ""
    
    
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
    
    func fetchProducts() {
        products = loadJson("products.json")
    }
    
    func loadJson(_ filename: String) -> [Item] {
        let data: Data
        
        // 프로젝트의 번들 파일들 중에서
        // 해당 이름의 파일이 존재하는지 확인해서
        // 그 파일이 있다면 file이라는 주소 값에 담고
        // 없다면 에러를 발생시키고 중지한다
        guard let file: URL = Bundle.main.url(forResource: filename, withExtension: nil) else {
            fatalError("\(filename) not found.")
        }
        
        // 존재하는 file 주소에 접근해 그 내용을 읽어서 Data 값으로 만든다
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Could not load \(filename): \(error)")
        }
        
        // 이제 Data 타입의 내용을 JSON이라고 생각해서
        // 원래 우리가 목표로 한 [Product] 타입으로 변환시켜 담아보도록 한다
        do {
            return try JSONDecoder().decode([Item].self, from: data)
        } catch {
            fatalError("Unable to parse \(filename): \(error)")
        }
    }
    
    
}
