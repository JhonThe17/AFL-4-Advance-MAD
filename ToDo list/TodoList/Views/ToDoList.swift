//
//  ListView.swift
//  TodoList
//
//  Created by Jhon The on 27/5/22.
//

import SwiftUI
    
struct ToDoList: View {
    
    @EnvironmentObject var todoviewmodel : TodoViewModel
    @AppStorage("_shouldShowOnboarding") var shouldShowOnboarding: Bool = true
    
    var body: some View {
            ZStack {
                if todoviewmodel.items.isEmpty {
                    Home()
                } else {
                    List {
                        ForEach(todoviewmodel.items) { item in
                            ListView(item: item)
                                .onTapGesture {
                                    withAnimation(.linear) {
                                        todoviewmodel.updateItem(item: item)
                                    }
                                }
                        }.onMove(perform: todoviewmodel.moveItem)
                            .onDelete(perform: todoviewmodel.deleteItem)
                    }
                    .listStyle(SidebarListStyle())
                }
            }
            .navigationTitle("Your Priority 📋")
            .navigationBarItems(
                leading: EditButton(),
                trailing:
                    NavigationLink("Add", destination: AddView())
                
            )
            .fullScreenCover(isPresented: $shouldShowOnboarding, content: {
                if #available(iOS 15.0, *) {
                    OnboardingView(shouldShowOnboarding: $shouldShowOnboarding)
                } else {
                    // Fallback on earlier versions
                }
            }
        )}
    }
    
struct ToDoList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ToDoList()
        }
        .environmentObject(TodoViewModel())
        
        }
    }
