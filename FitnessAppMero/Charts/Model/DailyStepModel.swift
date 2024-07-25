//
//  DailyStepModel.swift
//  FitnessAppMero
//
//  Created by Meriç Cem Baysar on 25.07.2024.
//

import Foundation


struct DailyStepModel: Identifiable {
    let id = UUID()
    let date: Date
    let count: Int
}
