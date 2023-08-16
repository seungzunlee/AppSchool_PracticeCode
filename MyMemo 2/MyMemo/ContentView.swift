//
//  ContentView.swift
//  MyMemo
//
//  Created by 안지영 on 2023/08/16.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var memoStore: MemoStore = MemoStore()
    
    @State var memoText: String = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(memoStore.memoArray) { memo in
                    Text(memo.text)
                }
                .onDelete(perform: memoStore.removeMemo)
            }
            HStack {
                TextField("메모를 입력하세요", text: $memoText)
                Button {
                    memoStore.addMemo(text: memoText)
                } label: {
                    Text("추가")
                }

            }
            .padding()
            .onAppear {
                Task {
                    memoStore.fetchMemo()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
