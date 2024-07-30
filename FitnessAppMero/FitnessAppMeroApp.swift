//
//  FitnessAppMeroApp.swift
//  FitnessAppMero
//
//  Created by Meriç Cem Baysar on 21.07.2024.
//

import SwiftUI
import RevenueCat
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct FitnessAppMeroApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
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
