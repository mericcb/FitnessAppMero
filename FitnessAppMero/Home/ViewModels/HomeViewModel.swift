//
//  HomeViewModel.swift
//  FitnessAppMero
//
//  Created by Meriç Cem Baysar on 22.07.2024.
//

import Foundation


class HomeViewModel: ObservableObject {
    
    let healthManager = HealthManager.shared
    
    @Published var calories: Int = 0
    @Published var exercise: Int = 0
    @Published var stand: Int = 0
    
    @Published var activities = [Activity]()
    
    var mockActivities = [
        Activity(title: "Today Steps", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .green, amount: "9812"),
        Activity(title: "Today", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .red, amount: "9812"),
        Activity(title: "Today Steps", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .blue, amount: "9812"),
        Activity(title: "Today Steps", subtitle: "Goal 50,000", image: "figure.run", tintColor: .purple, amount: "104,123")
    ]
    
    var mockWorkouts = [
        Workout(id: 0, title: "Running", image: "figure.run", tintColor: .cyan, duration: "51 mins", date: "Aug 1", calories: "451 kcal"),
        Workout(id: 1, title: "Strength Training", image: "figure.run", tintColor: .green, duration: "51 mins", date: "Aug 14", calories: "360 kcal"),
        Workout(id: 2, title: "Running", image: "figure.run", tintColor: .red, duration: "51 mins", date: "Aug 1", calories: "1000 kcal"),
        Workout(id: 3, title: "Running", image: "figure.run", tintColor: .blue, duration: "51 mins", date: "Aug 11", calories: "451 kcal")
    ]
    
    init() {
        Task {
            do {
                try await healthManager.requestHealthKitAccess()
                fetchTodayCalories()
                fetchTodayExerciseTime()
                fetchTodayStandHours()
                fetchTodaySteps()
                fetchCurrentWeekActivities()
            } catch {
                print(error.localizedDescription)
            }
        }
       }
    
    func fetchTodayCalories() {
        healthManager.fetchTodayCaloriesBurned { result in
            switch result {
            case.success(let calories):
                DispatchQueue.main.async {
                    self.calories = Int(calories)
                    let activity = Activity(title: "Calories Burned", subtitle: "today", image: "flame", tintColor: .red, amount: calories.formattedNumberString())
                    self.activities.append(activity)
                    
                }
            case.failure(let failure):
                print("Failed to fetch calories: \(failure.localizedDescription)")
            }
        }
    }
    
    func fetchTodayExerciseTime() {
        healthManager.fetchTodayExerciseTime { result in
            switch result {
            case.success(let exercise):
                DispatchQueue.main.async {
                    self.exercise = Int(exercise)
                }
            case.failure(let failure):
                print("Failed to fetch exercise: \(failure.localizedDescription)")
            }
        }    }
    
    func fetchTodayStandHours() {
        healthManager.fetchTodayStandHours { result in
            switch result {
            case.success(let hours):
                DispatchQueue.main.async {
                    self.stand = hours
                }
            case.failure(let failure):
                print("Failed to fetch stand hour: \(failure.localizedDescription)")
            }
        }
        
    }
    
    // MARK: Fitness Activity
    
    func fetchTodaySteps() {
        healthManager.fetchTodaySteps { result in
            switch result {
            case .success(let activity):
                DispatchQueue.main.async {
                    self.activities.append(activity)
                }
            case.failure(let failure):
                print("Failed to fetch today steps: \(failure.localizedDescription)")
            }
        }
    }
    
    func fetchCurrentWeekActivities() {
        healthManager.fetchCurrentWeekWorkoutStats { result in
            switch result {
            case .success(let activities):
                DispatchQueue.main.async {
                    self.activities.append(contentsOf: activities)
                }
            case.failure(let failure):
                print("Failed to fetch week activities: \(failure.localizedDescription)")
            }

        }
    }
    
}
