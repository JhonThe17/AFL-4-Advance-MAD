//
//  ListView.swift
//  TodoList
//
//  Created by Jhon The on 27/5/22.
//

import SwiftUI
    
struct ToDoList: View {
    
    @EnvironmentObject var todoviewmodel : TodoViewModel
    @AppStorage("_showOnboarding") var showOnboarding : Bool = true
    
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
        .fullScreenCover(isPresented: $showOnboarding, content: {
            OnboardingView(showOnboarding: $showOnboarding)
        })
        .navigationTitle("Your Priority 📋")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView())
            )
    }
    
    struct OnboardingView: View {
        @Binding var showOnboarding: Bool
        
        var body: some View{
            
            VStack(alignment: .leading, spacing: 10){
                Text("Welcome to To Do List with this app you can...")
                    .multilineTextAlignment(.center)
                    .font(.title)
                    
                HStack{
                    Image(systemName: "square.and.pencil")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.blue)
                    Spacer()
                    Text("Add important tasks to the list")
                        .bold()
                        .padding()
                    
                    
                }.padding()
                
                
                HStack{
                    Image(systemName: "checklist")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.blue)
                    Spacer()
                    
                    Text("Rearrange your tasks and check finished tasks")
                        .bold()
                        .padding()
                }.padding()
                
                HStack{
                    Image(systemName: "delete.left")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.blue)
                    Spacer()
                    
                    Text("Delete finished or unused tasks")
                        .bold()
                        .padding()
                }.padding()
            }
            .padding(50)
            Spacer()
            
            Button(action: {
                showOnboarding.toggle()
            }, label: {
                Text("Get Started")
                    .bold()
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
            })
            .padding()
        }
    }

struct ToDoList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ToDoList()
        }
        .environmentObject(TodoViewModel())
        
        }
    }
}
