//
//  ContentView.swift
//  ShoppingList
//
//  Created by 아라 on 2023/08/04.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var shoppingItemStore: ItemStore = ItemStore()
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    VStack {
                        LazyVStack {
                            ForEach(shoppingItemStore.products) { item in
                                ItemView(item: item, itemStore: shoppingItemStore)
                            }
                            
                        }
                    }
                }
//                Spacer()
                HStack {
                    Text(shoppingItemStore.fetchResults)
                }
            }
            .listStyle(.plain)
            .padding()
            .navigationTitle("상품 목록")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        CartView(itemStore: shoppingItemStore, url: URL(string: "https://naver.com")!)
                    } label: {
                        Image(systemName: "cart")
                    }
                }
            }
            .refreshable {
                Task {
                    await shoppingItemStore.fetchProducts()
                }
            }
            .onAppear {
                Task {
                    await shoppingItemStore.fetchProducts()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView()
        }
    }
}
