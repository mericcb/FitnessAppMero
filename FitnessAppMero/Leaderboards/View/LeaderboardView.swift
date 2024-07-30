//
//  LeaderboardView.swift
//  FitnessAppMero
//
//  Created by Meriç Cem Baysar on 28.07.2024.
//

import SwiftUI

struct LeaderboardUser: Codable, Identifiable {
    let id = UUID()
    let userName: String
    let count: Int
}

class LeaderboardViewModel: ObservableObject{
    
    var mockData = [
        LeaderboardUser(  userName: "Mero", count: 3435),
        LeaderboardUser(  userName: "Arda", count: 4574),
        LeaderboardUser(  userName: "Ezgi", count: 1233),
        LeaderboardUser(  userName: "Paco", count: 9656),
        LeaderboardUser(  userName: "Ossie", count: 24312),
        LeaderboardUser(  userName: "Jason", count: 4454),
        LeaderboardUser(  userName: "Test", count: 5555),
        LeaderboardUser(  userName: "Micheal", count: 2222),
        LeaderboardUser(  userName: "XXXX", count: 2423),
        LeaderboardUser(  userName: "YYYY", count: 13123),
        LeaderboardUser(  userName: "Cucu", count: 1233),
        LeaderboardUser(  userName: "Salla", count: 4574)
    
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
        .task {
            do {
                try await DatabaseManager.shared.postStepCountUpdateFor(username: "Mero", count: 1111)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    LeaderboardView(showTerms: .constant(false))
}
