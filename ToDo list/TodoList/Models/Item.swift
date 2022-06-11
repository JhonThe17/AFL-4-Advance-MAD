//
//  ItemModel.swift
//  TodoList
//
//  Created by Jhon The on 28/5/22.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    let date: String
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool, date: String) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.date = date
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted, date: date)
    }
}

