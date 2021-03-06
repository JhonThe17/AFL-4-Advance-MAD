//
//  OnBoarding.swift
//  TodoList
//
//  Created by Jhon The on 11/06/22.
//

import Foundation
import SwiftUI

@available(iOS 15.0, *)
struct OnboardingView: View {
    @Binding var shouldShowOnboarding: Bool
    
    @available(iOS 15.0, *)
    var body: some View {
        if #available(iOS 15.0, *) {
            VStack(alignment: .leading, spacing: 16){
                RoundedRectangle(cornerRadius: 25)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.pink]), startPoint:  .leading, endPoint: .trailing))
                    .frame(height: 60)
                    .mask(Text("To do list apps")
                        .bold()
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .leading))
                Label(
                    title:{ Text("Add item to your list")
                        .font(.system(size: 20))},
                    icon:{ Image(systemName: "pencil.circle")})
                .font(.system(size: 32))
                .padding()
                Label(
                    title:{ Text("Checked your list")
                        .font(.system(size: 20))},
                    icon:{ Image(systemName: "checkmark")})
                .font(.system(size: 32))
                .padding()
                Label(
                    title:{ Text("Prioritize your list")
                        .font(.system(size: 20))},
                    icon:{ Image(systemName: "list.bullet")})
                .font(.system(size: 32))
                .padding()
                Button(action: {
                    shouldShowOnboarding.toggle()
                },label: {
                    Text("Get Started")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.pink, Color.purple]), startPoint:  .leading, endPoint: .trailing))
                        .cornerRadius(20)
                    
                })
                
                
            }
            .padding(40)
            .background(.white)
            .mask(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10), style: .continuous))
            .padding(20)
            .shadow(color: Color.black, radius: 5, x: 0.2, y: 0.2)
        } else {
            // Fallback on earlier versions
        }
    }
}

