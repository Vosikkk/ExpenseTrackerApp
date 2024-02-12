//
//  ContentView.swift
//  ExpenseTrackerApp
//
//  Created by Саша Восколович on 12.02.2024.
//

import SwiftUI

struct ContentView: View {
    
    /// - Intro Visibility Status
    @AppStorage("isFirstTime") private var isFirstTime: Bool = true
    
    /// Active Tab
    @State private var activeTab: Tab = .recents
    
    var body: some View {
        TabView(selection: $activeTab) {
            
            makeTab(withName: "Recents", tag: .recents) {
                Tab.recents.tabContent
            }
            
            makeTab(withName: "Search", tag: .search) {
                Tab.search.tabContent
            }
            
            makeTab(withName: "Chart", tag: .charts) {
                Tab.charts.tabContent
            }
            
            makeTab(withName: "Settings", tag: .settings) {
                Tab.settings.tabContent
            }
        }
        .tint(appTint)
        .sheet(isPresented: $isFirstTime) {
            IntroScreen()
                .interactiveDismissDisabled()
        }
    }
    
    func makeTab(withName name: String, tag: Tab, item: () -> some View) -> some View {
        Text(name)
            .tag(tag)
            .tabItem { item() }
    }
}

#Preview {
    ContentView()
}
