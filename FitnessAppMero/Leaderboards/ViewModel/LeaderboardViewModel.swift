//
//  LeaderboardViewModel.swift
//  FitnessAppMero
//
//  Created by Meriç Cem Baysar on 4.08.2024.
//

import Foundation



class LeaderboardViewModel: ObservableObject{
    @Published var leaders = [LeaderboardUser]()
    
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
    
    init() {
        Task {
            do {
                try await postStepCountUpdateForUser(username: "xcode", count: 123)
                let result = try await fetchLeaderboards()
                DispatchQueue.main.async {
                    self.leaders = result.top10
                }
            }catch {
                print(error.localizedDescription)
            }
        }
    }
    
    struct LeaderboardResult {
        let user: LeaderboardUser?
        let top10: [LeaderboardUser]
    }
    
    
    func fetchLeaderboards() async throws -> LeaderboardResult {
        let leaders = try await DatabaseManager.shared.fetchLeaderboards()
        let top10 = Array(leaders.sorted(by: { $0.count > $1.count }).prefix(10))
        let username = UserDefaults.standard.string(forKey: "username")
        
        if let username = username {
            let user = leaders.first(where: { $0.userName == username })
            return LeaderboardResult(user: user, top10: top10)
        } else {
            return LeaderboardResult(user: nil, top10: top10)
        }
        
    }
    
    func postStepCountUpdateForUser(username: String, count: Int) async throws {
        try await DatabaseManager.shared.postStepCountUpdateFor(leader: LeaderboardUser(userName: username, count: count))
    }
    
}
