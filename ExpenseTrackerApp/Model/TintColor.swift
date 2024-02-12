//
//  TintColor.swift
//  ExpenseTrackerApp
//
//  Created by Саша Восколович on 12.02.2024.
//

import SwiftUI


/// Custom Tint Colors for Transaction Row

struct TintColor: Identifiable {
    
    let id: UUID = .init()
    var color: String
    var value: Color
}

var tints: [TintColor] = [
    .init(color: "Red", value: .red),
    .init(color: "Blue", value: .blue),
    .init(color: "Pink", value: .pink),
    .init(color: "Purple", value: .purple),
    .init(color: "Brown", value: .brown),
    .init(color: "Orange", value: .orange)
]
