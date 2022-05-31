//
//  TodoListApp.swift
//  TodoList
//
//  Created by Jhon The on 28/5/22.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    @StateObject var todomodel: TodoModel = TodoModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ToDoList()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(todomodel)
        }
    }
}
