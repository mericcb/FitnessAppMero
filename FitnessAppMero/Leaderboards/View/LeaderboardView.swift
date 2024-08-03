//
//  LeaderboardView.swift
//  FitnessAppMero
//
//  Created by Meriç Cem Baysar on 28.07.2024.
//

import SwiftUI


struct LeaderboardView: View {
    @StateObject var viewModel = LeaderboardViewModel()
    
    
    @Binding var showTerms: Bool
    
    var body: some View {
        VStack {
            Text("Leaderboard")
                .font(.largeTitle)
                .bold()
            
            HStack {
                Text("Name")
                    .bold()
                
                Spacer()
                
                Text("Steps")
                    .bold()
                
            }
            .padding()
            
            LazyVStack(spacing: 16) {
                ForEach(viewModel.leaders) { data in
                    HStack {
                        Text("1.")
                        
                        Text(data.userName)
                        
                        Spacer()
                        
                        Text("\(data.count)")
                    }
                    .padding(.horizontal)
                }
            }
            
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .fullScreenCover(isPresented: $showTerms) {
            TermsView()
        }
    }
}

#Preview {
    LeaderboardView(showTerms: .constant(false))
}
