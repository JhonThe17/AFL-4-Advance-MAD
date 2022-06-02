//
//  ListView.swift
//  TodoList
//
//  Created by Jhon The on 27/5/22.
//

import SwiftUI
    
struct ToDoList: View {
    
    @EnvironmentObject var todomodel: TodoModel
    
    var body: some View {
        ZStack {
            if todomodel.items.isEmpty {
                Home()
            } else {
                List {
                    ForEach(todomodel.items) { item in
                        Checkmark(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    todomodel.updateItem(item: item)
                            }
                        }
                    }.onMove(perform: todomodel.moveItem)
                        .onDelete(perform: todomodel.deleteItem)
                }
                .listStyle(SidebarListStyle())
            }
        }
        .navigationTitle("Your Priority 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView())
            )
    }

struct ToDoList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ToDoList()
        }
        .environmentObject(TodoModel())
        
        }
    }
}
