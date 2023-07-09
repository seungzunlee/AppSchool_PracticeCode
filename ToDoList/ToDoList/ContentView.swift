//
//  ContentView.swift
//  ToDoList
//
//  Created by 이승준 on 2023/07/05.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var toDoStore: ToDoStore = ToDoStore()
    
    @State var content: String = ""
    
    var body: some View {
        VStack {
            List {
                ForEach($toDoStore.todos) { $toDo in
                    ToDoListRow(toDoStore: toDoStore, toDo: $toDo)
                }
                .onMove(perform: moveList)
                .onDelete(perform: removeRows)
            }
            TextField("content", text: $content)
            Button {
                toDoStore.addToDo(content: content)
            } label: {
                Text("확인")
            }

        }
    }
    
    // 선행학습
    
    // 당겨서 지우기
    func removeRows(at offsets: IndexSet) {
            toDoStore.todos.remove(atOffsets: offsets)
        }
    // 꾹 눌러서 리스트 옮기기
    func moveList(from source: IndexSet, to destination: Int) {
            toDoStore.todos.move(fromOffsets: source, toOffset: destination)
            }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
