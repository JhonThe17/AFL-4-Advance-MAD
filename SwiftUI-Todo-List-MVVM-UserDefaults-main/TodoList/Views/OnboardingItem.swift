//
//  OnboardingItem.swift
//  TodoList
//
//  Created by Jhon The on 30/05/22.
//

import Foundation

struct OnboardingItem: Identifiable {
    
    var id = UUID()
    var title: String?
    var desc: String? 
    var sfSymbol: String?
    
}
