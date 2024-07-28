//
//  FitnessTabView.swift
//  FitnessAppMero
//
//  Created by Meriç Cem Baysar on 22.07.2024.
//

import SwiftUI
import RevenueCat

struct FitnessTabView: View {
    @AppStorage("username") var username: String?
    @State var selectedTab = "Home"
    @State var isPremium = false
    @State var showTerms = true
    
    init() {
        let appearence = UITabBarAppearance()
        appearence.configureWithOpaqueBackground()
        appearence.stackedLayoutAppearance.selected.iconColor = .green
        appearence.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.green]
        
        UITabBar.appearance().scrollEdgeAppearance = appearence
    }
    
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView(isPremium: $isPremium)
                .tag("Home")
                .tabItem {
                    Image(systemName: "house")
                    
                    Text("Home")
                }
            
            ChartView()
                .tag("Chart")
                .tabItem {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                    
                    Text("Charts")
                }
            
            LeaderboardView(showTerms: $showTerms)
                .tag("Leaderboard")
                .tabItem {
                    Image(systemName: "list.bullet")
                    
                    Text("Leaderboard")
                }
            
            
        }
        .onAppear {
            showTerms = username == nil
            Purchases.shared.getCustomerInfo { customerInfo, error in
                isPremium = customerInfo?.entitlements["premium"]?.isActive == true
            }
        }
    }
}

#Preview {
    FitnessTabView()
}
