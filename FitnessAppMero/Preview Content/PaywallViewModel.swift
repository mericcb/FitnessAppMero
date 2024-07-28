//
//  PaywallViewModel.swift
//  FitnessAppMero
//
//  Created by Meriç Cem Baysar on 28.07.2024.
//

import Foundation
import RevenueCat

class PaywallViewModel: ObservableObject {
    
    @Published var currenOffering: Offering?
    
    init() {
        Purchases.shared.getOfferings { (offerings, error) in
            if let offering = offerings?.current {
                DispatchQueue.main.async {
                    self.currenOffering = offering
                }
            }
        }
    }
    
    func purchase(package: Package) async throws {
        let result = try await Purchases.shared.purchase(package: package)
        if result.customerInfo.entitlements["premium"]?.isActive != true {
            throw URLError(.badURL)
        }
    }
        func restorePurchases() async throws {
            let customerInfo = try await
            Purchases.shared.restorePurchases()
            if customerInfo.entitlements["premium"]?.isActive != true {
                throw URLError(.badURL)
            }
        }
        
        
    }

