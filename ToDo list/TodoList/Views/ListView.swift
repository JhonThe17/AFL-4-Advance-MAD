//
//  ListRowView.swift
//  TodoList
//
//  Created by Jhon The on 27/5/22.
//

import SwiftUI

struct ListView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Image(systemName: item.isCompleted ? "checkmark.circle": "circle")
                        .foregroundColor(item.isCompleted ? .green : .red)
                    Text(item.title)
                        .strikethrough(item.isCompleted ? true : false)
                    Spacer()
                    
                }
                .font(.title2)
                .padding(.vertical, 8)
                HStack {
                    Text("Deadline: \(item.date)" )
                        .strikethrough(item.isCompleted ? true : false)
                    Spacer()
                }
                .font(.title3)
                .padding(.vertical, 8)
            }
            Spacer()
        }
    }
}


struct Checkmark_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "First Item", isCompleted: false, date: "Jun 6, 2022, 1:26 PM")
    static var item2 = ItemModel(title: "Second Item", isCompleted: true, date: "Jun 6,2022, 1:30 PM")
    
    static var previews: some View {
        Group {
            ListView(item: item1)
            ListView(item: item2)
        }
        .previewLayout(.sizeThatFits)
        
    }
}
