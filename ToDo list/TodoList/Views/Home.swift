//
//  NoItemsView.swift
//  TodoList
//
//  Created by Jhon The on 27/5/22.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.top, 150)
                
                Text("List what you want to do for 1 day.. let's be more productive!")
                    .padding([.leading, .bottom, .trailing], 10.0)
                    
            }
        }
    
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
                .navigationTitle("Title")
            }
        }
    }
}
