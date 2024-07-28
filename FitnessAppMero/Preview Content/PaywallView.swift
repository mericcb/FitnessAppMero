//
//  PaywallView.swift
//  FitnessAppMero
//
//  Created by Meriç Cem Baysar on 26.07.2024.
//

import SwiftUI
import RevenueCat


struct PaywallView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = PaywallViewModel()
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Premium Membership")
                .font(.largeTitle)
                .bold()
            
            Text("Get fit, get active, today")
            
            Spacer()
            
            // Features
            VStack(spacing: 20) {
                HStack {
                    Image(systemName: "figure.run")
                    
                    Text("Exercise boosts energy levels and promotes vitality")
                        .lineLimit(1)
                        .font(.system(size: 14))
                }
                
                HStack {
                    Image(systemName: "figure.run")
                    
                    Text("Exercise boosts energy levels and promotes vitality")
                        .lineLimit(1)
                        .font(.system(size: 14))
                }
                
                HStack {
                    Image(systemName: "figure.run")
                    
                    Text("Exercise boosts energy levels and promotes vitality")
                        .lineLimit(1)
                        .font(.system(size: 14))
                }
            }
            Spacer()
            
            HStack {
                if let offering = viewModel.currenOffering {
                    ForEach(offering.availablePackages) { package in
                        Button{
                            Purchases.shared.purchase(package: package) { (transaction, customerInfo, error, userCancelled) in
                                if customerInfo?.entitlements["premium"]?.isActive == true {
                                    // Unlock that great "pro" content
                                    dismiss()
                                }
                            }
                        } label: {
                            VStack(spacing: 8) {
                                Text(package.storeProduct.localizedTitle)
                                
                                Text(package.storeProduct.localizedPriceString)
                            }
                            .foregroundStyle(.primary)
                            .frame(maxWidth: .infinity)
                        }
                        .padding()
                        .frame(height: 100)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(lineWidth: 2)
                                .foregroundStyle(.green)
                        
                        )
                        
                    }
                    
                }
            }
            .padding(.horizontal, 40)
            
            
            Button {
                Purchases.shared.restorePurchases { customerInfo, error in
                    if customerInfo?.entitlements["premium"]?.isActive == true {
                        dismiss()
                    }
                }
            } label: {
                Text("Restore Purchases")
                    .foregroundStyle(.green)
                    .underline()
            }
            
            Spacer()
            
            HStack(spacing: 12) {
                Link("Terms of Use (EULA)", destination: URL(string: "https://github.com/mericcb")!)
                
                Link("Privacy Policy", destination: URL(string: "https://github.com/mericcb")!)
                
            }
            
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    PaywallView()
}
