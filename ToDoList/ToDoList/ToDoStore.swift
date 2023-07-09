//
//  ToDoStore.swift
//  ToDoList
//
//  Created by 이승준 on 2023/07/05.
//

import Foundation
import Combine

class ToDoStore: ObservableObject {
    @Published var todos: [ToDo]
    
    init() {
        self.todos = [
            ToDo(content: "졸리다", isComplete: false),
            ToDo(content: "배고프다", isComplete: false),
            ToDo(content: "피자가 먹고 싶다", isComplete: false),
            ToDo(content: "미쳤다", isComplete: false),
        ]

    }
    func addToDo(content: String) {
        if content.count > 0 {
            let newTodo: ToDo = ToDo(content: content, isComplete: false)
            
            todos.append(newTodo)
        }
    }
    
    
    func removeToDo(_ todo: ToDo) {
//        print("1:\(todos[0].id), 2:\(todo.id)")
        todos.removeAll(where: { $0.id == todo.id })
    }
    
    func completeToDo(_ todo: ToDo) {
        removeToDo(todo)
        todos.append(todo)
    }
}
