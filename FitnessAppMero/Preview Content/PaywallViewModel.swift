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
    
}
