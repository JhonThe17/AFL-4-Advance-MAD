//
//  ListRowView.swift
//  TodoList
//
//  Created by Jhon The on 27/5/22.
//

import SwiftUI

struct Checkmark: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "First item!", isCompleted: false)
    static var item2 = ItemModel(title: "Second Item.", isCompleted: true)
    
    static var previews: some View {
        Group {
            Checkmark(item: item1)
            Checkmark(item: item2)
        }
        .previewLayout(.sizeThatFits)
        
    }
}
