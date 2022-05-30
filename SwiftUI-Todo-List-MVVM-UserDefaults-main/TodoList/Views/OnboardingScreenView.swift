//
//  OnboardingScreenView.swift
//  TodoList
//
//  Created by Jhon The on 30/05/22.
//

import SwiftUI

struct OnboardingScreenView: View {
    
    var body: some View {
        
        TabView {
            OnboardingView(item: OnboardingItem(title:"Lorem",
                            sfSymbol: "clock.badge.checkmark"))
            OnboardingView(item: OnboardingItem(title:"Lorem",
                            sfSymbol: "clock.badge.checkmark"))
          
        
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct OnboardingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreenView()
    }
}
