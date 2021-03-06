//
//  ListViewModel.swift
//  TodoList
//
//  Created by Jhon The on 28/5/22.
//

import Foundation

class TodoViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
    
    didSet {
        saveItems()
    }
}
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }

        self.items = savedItems
    }
    
    func addItem(title: String, date: String) {
        let newItem = ItemModel(title: title, isCompleted: false, date: date)
        items.append(newItem)
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to : Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
    

