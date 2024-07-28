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
    @Binding var isPremium: Bool
    
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
                            Task {
                                do {
                                    try await viewModel.purchase(package: package)
                                    isPremium = true
                                    dismiss()
                                }catch {
                                    print(error.localizedDescription)
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
                Task {
                    do {
                        try await viewModel.restorePurchases()
                        dismiss()
                    }catch {
                        print(error.localizedDescription)
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
        .padding(.top)
    }
}

#Preview {
    PaywallView(isPremium: .constant(false))
}
