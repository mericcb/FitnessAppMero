//
//  LeaderboardUser.swift
//  FitnessAppMero
//
//  Created by Meriç Cem Baysar on 4.08.2024.
//

import Foundation

struct LeaderboardUser: Codable, Identifiable {
    let id = UUID()
    let userName: String
    let count: Int
}
