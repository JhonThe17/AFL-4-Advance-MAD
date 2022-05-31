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
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
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
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Your Priority 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView())
            )
    }

}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TodoModel()
        }
        .environmentObject(TodoModel())
    }
}
