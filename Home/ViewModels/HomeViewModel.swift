//
//  HomeViewModel.swift
//  FitnessAppMero
//
//  Created by Meriç Cem Baysar on 22.07.2024.
//

import Foundation


class HomeViewModel: ObservableObject {
    
    @Published var calories: Int = 123
    @Published var active: Int = 52
    @Published var stand: Int = 8
    
    var mockActivities = [
        Activity(id: 0, title: "Today Steps", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .green, amount: "9812"),
        Activity(id: 1, title: "Today", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .red, amount: "9812"),
        Activity(id: 2, title: "Today Steps", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .blue, amount: "9812"),
        Activity(id: 3, title: "Today Steps", subtitle: "Goal 50,000", image: "figure.run", tintColor: .purple, amount: "104,123")
    ]
    
    var mockWorkouts = [
        Workout(id: 0, title: "Running", image: "figure.run", tintColor: .cyan, duration: "51 mins", date: "Aug 1", calories: "451 kcal"),
        Workout(id: 1, title: "Strength Training", image: "figure.run", tintColor: .green, duration: "51 mins", date: "Aug 14", calories: "360 kcal"),
        Workout(id: 2, title: "Running", image: "figure.run", tintColor: .red, duration: "51 mins", date: "Aug 1", calories: "1000 kcal"),
        Workout(id: 3, title: "Running", image: "figure.run", tintColor: .blue, duration: "51 mins", date: "Aug 11", calories: "451 kcal")
    ]
    
}
