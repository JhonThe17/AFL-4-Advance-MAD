//
//  OnboardingView.swift
//  TodoList
//
//  Created by Jhon The on 29/05/22.
//

import SwiftUI

struct OnboardingView: View {
    
    let item : OnboardingItem
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Text("About this Apps").font(.largeTitle).fontWeight(.bold).multilineTextAlignment(.center).padding(.bottom, 80)
            
            Image(systemName: item.sfSymbol ?? "")
                .padding(.bottom, 20)
                .font(.system(size: 120, weight: .bold))
            
            Text(item.title ?? "")
                .font(.system(size: 32, weight: .bold))
                .multilineTextAlignment(.center)
                .padding(.bottom, 10)
                .foregroundColor(.black)
            
            Button(action: {
            }, label: {
                Text("Get Started")
            })
            .font(.system(size: 18, weight: .bold))
            .foregroundColor(.white)
            .padding(.horizontal, 25)
            .padding(.vertical, 10)
            .background(Color.blue)
            .clipShape(Capsule())
            .padding(.top, 80)
            .animation(.easeInOut(duration: 0.25))
            }
        .padding(.bottom, 100)
        }
    }


struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(item: OnboardingItem(title:"Lorem",
                                            sfSymbol:"clock.badge.checkmark"
                                           ))
    }
}
