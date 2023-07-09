//
//  ToDo.swift
//  ToDoList
//
//  Created by 이승준 on 2023/07/05.
//

import Foundation

struct ToDo: Identifiable {
    var id: UUID = UUID()
    var content: String
    var isComplete: Bool
    
    var getTenString: String {
        get {
            return String(content.prefix(10))
        }
        
    }
}
