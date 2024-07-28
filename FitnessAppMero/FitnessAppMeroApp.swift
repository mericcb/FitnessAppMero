//
//  FitnessAppMeroApp.swift
//  FitnessAppMero
//
//  Created by Meriç Cem Baysar on 21.07.2024.
//

import SwiftUI
import RevenueCat

@main
struct FitnessAppMeroApp: App {
    
    init () {
        Purchases.logLevel = .debug
        Purchases.configure(withAPIKey: "appl_tccZDFgeHLBVqoOIQscIKESpCHQ")
        
    }
    
    var body: some Scene {
        WindowGroup {
            FitnessTabView()
        }
    }
}
