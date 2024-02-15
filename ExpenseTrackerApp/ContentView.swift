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
    /// App Lock Properties
    @AppStorage("isAppLockEnabled") private var isAppLockEnabled: Bool = false
    @AppStorage("lockWhenAppGoesBackground") private var lockWhenAppGoesBackground: Bool = false
    /// Active Tab
    @State private var activeTab: Tab = .recents
    
    var body: some View {
        
         LockView(lockType: .biometric, lockPin: "", isEnabled: isAppLockEnabled, lockWhenAppGoesBackground: lockWhenAppGoesBackground) {
            TabView(selection: $activeTab) {
                
                makeTab(for: Recents(), tag: .recents) {
                    Tab.recents.tabContent
                }
                
                makeTab(for: Search(), tag: .search) {
                    Tab.search.tabContent
                }
                
                makeTab(for: Graphs(), tag: .charts) {
                    Tab.charts.tabContent
                }
                
                makeTab(for: Settings(), tag: .settings) {
                    Tab.settings.tabContent
                }
            }
            .tint(appTint)
            .sheet(isPresented: $isFirstTime) {
                IntroScreen()
                    .interactiveDismissDisabled()
            }
        }
    }
    
    
    func makeTab(for view: some View, tag: Tab, item: () -> some View) -> some View {
        view
            .tag(tag)
            .tabItem { item() }
    }
}

#Preview {
    ContentView()
}
