//
//  NoItemsView.swift
//  TodoList
//
//  Created by Jhon The on 27/5/22.
//

import SwiftUI

struct Home: View {
    
    @State var animate : Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.top, 150)
                
                Text("List what you want to do for 1 day.. let's be more productive!")
            }
                    .padding([.leading, .bottom, .trailing], 10.0)
                    .multilineTextAlignment(.center)
                    .onAppear(perform: addAnimation)
                    .scaleEffect(animate ? 1.05 : 1.0)
                    .foregroundColor(Color.white)
                    .colorMultiply(animate ? Color.purple : Color.pink)
                    .shadow(color: animate ? Color.purple.opacity(0.20) : Color.pink.opacity(0.20),
                            radius: animate ? 10 : 1,
                            x: 2,
                            y: 2)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            }
                
        func addAnimation() {
            guard !animate else { return }
            DispatchQueue.main.asyncAfter(deadline: .now()+1.5){
                withAnimation(
                    Animation
                        .easeInOut(duration: 2.5)
                        .repeatForever()
                ){
                    animate.toggle()
                }
            }
        }
    }

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Home()
                .navigationTitle("Your Priority 📝")
            }
        }
    }

