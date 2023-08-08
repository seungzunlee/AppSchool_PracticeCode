//
//  ShoppingItemDetailView.swift
//  ShoppingList
//
//  Created by 아라 on 2023/08/04.
//

import SwiftUI

struct ItemView: View {
    var item: Item
    var itemStore: ItemStore
    @State var isShowingAlert = false
    
    var body: some View {
        HStack {
            AsyncImage(url: item.imageUrl) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
            } placeholder: {
                ProgressView()
            }
            .border(.gray)
            
            VStack(alignment: .leading) {
                HStack {
                    Text("\(item.shoppingName)")
                        .font(.title2)
                        .padding(.bottom, 5)
                    
                    Spacer()
                    
                    Button {
                        itemStore.addItem(item: item)
                        isShowingAlert.toggle()
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.title)
                    }
                    .alert(isPresented: $isShowingAlert) {
                        Alert(title: Text("장바구니에 추가되었습니당^ㅡ^"))
                    }
                }
                Text("\(item.name)")
                    
                HStack {
                    Spacer()
                    Text("\(item.price)")
                }
                .padding()
            }

        }
    }
}

struct ShoppingItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(item: Item(id: "p1", name: "삼성전자 갤럭시 Z 플립5 5G 자급제 SM-F731N", imageUrlString: "https://images.samsung.com/kdp/event/sec/2023/0801_galaxy_flip5/preorder/buying/slide/flip5_buying_default01_pc.png", price: 1289000, shoppingName: "Coupang", shoppingUrlString: "https://www.coupang.com/vp/products/7410157624?itemId=19197972081&vendorItemId=86315402641&q=%ED%95%B8%EB%93%9C%ED%8F%B0&itemsCount=36&searchId=cc5372605ae348519b0819e0682c0bf0&rank=0&isAddedCart="), itemStore: ItemStore())
    }
}
