//
//  LeaderboardView.swift
//  FitnessAppMero
//
//  Created by Meriç Cem Baysar on 28.07.2024.
//

import SwiftUI

struct LeaderboardUser: Codable, Identifiable {
    let id: Int
    let createdAt: String
    let userName: String
    let count: Int
}

class LeaderboardViewModel: ObservableObject{
    
    var mockData = [
        LeaderboardUser(id: 0, createdAt: "", userName: "Mero", count: 3435),
        LeaderboardUser(id: 1, createdAt: "", userName: "Arda", count: 4574),
        LeaderboardUser(id: 2, createdAt: "", userName: "Ezgi", count: 1233),
        LeaderboardUser(id: 3, createdAt: "", userName: "Paco", count: 9656),
        LeaderboardUser(id: 4, createdAt: "", userName: "Ossie", count: 24312),
        LeaderboardUser(id: 5, createdAt: "", userName: "Jason", count: 4454),
        LeaderboardUser(id: 6, createdAt: "", userName: "Test", count: 5555),
        LeaderboardUser(id: 7, createdAt: "", userName: "Micheal", count: 2222),
        LeaderboardUser(id: 8, createdAt: "", userName: "XXXX", count: 2423),
        LeaderboardUser(id: 9, createdAt: "", userName: "YYYY", count: 13123),
        LeaderboardUser(id: 10, createdAt: "", userName: "Cucu", count: 1233),
        LeaderboardUser(id: 11, createdAt: "", userName: "Salla", count: 4574)
    
    ]
}



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
                ForEach(viewModel.mockData) { data in
                    HStack {
                        Text("\(data.id).")
                        
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
