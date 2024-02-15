//
//  ExpenseTrackerApp.swift
//  ExpenseTrackerApp
//
//  Created by Саша Восколович on 12.02.2024.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Transaction.self])
    }
}
