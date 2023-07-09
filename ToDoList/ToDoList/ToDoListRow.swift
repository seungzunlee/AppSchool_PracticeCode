//
//  ToDoListRow.swift
//  ToDoList
//
//  Created by 이승준 on 2023/07/05.
//

import SwiftUI

struct ToDoListRow: View {
    
    var toDoStore: ToDoStore
    
    @Binding var toDo: ToDo
    
    var body: some View {
        HStack {
            if toDo.isComplete == false {
                Text("\(toDo.getTenString)")
            } else {
                Text("\(toDo.getTenString)")
                    .strikethrough(color:.black)
                    .foregroundColor(.red)
            }
            Spacer()
            Button {
                //                toDoStore.removeToDo(toDo)
                toDo.isComplete.toggle()
                toDoStore.completeToDo(toDo)
            } label: {
                //                Text("완료")
                if toDo.isComplete == false {
                    Image(systemName: "square")
                } else {
                    Image(systemName: "checkmark.square")
                }
            }
            //            .buttonStyle(PlainButtonStyle())
            
        }
        .padding()
    }
}

struct ToDoListRow_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListRow(toDoStore: ToDoStore(), toDo: .constant(ToDo(content: "dffdsf", isComplete: false)))
    }
}
