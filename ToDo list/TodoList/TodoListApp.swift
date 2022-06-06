//
//  TodoListApp.swift
//  TodoList
//
//  Created by Jhon The on 28/5/22.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    @StateObject var todoviewmodel: TodoViewModel = TodoViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ToDoList()
            }
            .environmentObject(todoviewmodel)
        }
    }
}
