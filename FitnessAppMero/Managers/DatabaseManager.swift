//
//  DatabaseManager.swift
//  FitnessAppMero
//
//  Created by Meriç Cem Baysar on 29.07.2024.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift


class DatabaseManager {
    
    static let shared = DatabaseManager()
    let weeklyLeaderboard = "\(Date().mondayDateFormat())-leaderboard"
    
    
    private init () { }
        let database = Firestore.firestore()
        
        func fetchLeaderboards() async throws -> [LeaderboardUser] {
            let snapshot = try await database.collection(weeklyLeaderboard).getDocuments()
            return try snapshot.documents.compactMap( { try $0.data(as: LeaderboardUser.self) })
        }
    
    func postStepCountUpdateFor(username: String, count: Int) async throws {
        
        let documentRef = database.collection(weeklyLeaderboard).document(username)
                
                // Belirtilen kullanıcı için mevcut count değerini alıyoruz
                let document = try await documentRef.getDocument()
                
                if let currentCount = document.data()?["count"] as? Int {
                    // Mevcut count değerine yeni değeri ekliyoruz
                    let newCount = currentCount + count
                    try await documentRef.updateData(["count": newCount])
                } else {
                    // Eğer kullanıcı için veri yoksa, yeni bir doküman oluşturuyoruz
                    let leader = LeaderboardUser(userName: username, count: count)
                    let data = try Firestore.Encoder().encode(leader)
                    try await documentRef.setData(data, merge: false)
                }
    }
        
}
