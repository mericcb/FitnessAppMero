//
//  ChartViewModel.swift
//  FitnessAppMero
//
//  Created by Meriç Cem Baysar on 25.07.2024.
//

import Foundation


class ChartViewModel: ObservableObject {
    let mockWeekChartData = [
        
        DailyStepModel(date: Date(), count: 13213),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date(), count: 7896),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date(), count: 5345),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -3, to: Date()) ?? Date(), count: 3454),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -4, to: Date()) ?? Date(), count: 1231),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -5, to: Date()) ?? Date(), count: 2342),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -6, to: Date()) ?? Date(), count: 4566)
    ]
    
    let mockYTDChartData = [
        
       MonthlyStepModel(date: Date(), count: 13213),
       MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -1, to: Date()) ?? Date(), count: 7896),
       MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -2, to: Date()) ?? Date(), count: 5345),
       MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -3, to: Date()) ?? Date(), count: 1232),
       MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -4, to: Date()) ?? Date(), count: 4684),
       MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -5, to: Date()) ?? Date(), count: 9634),
       MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -6, to: Date()) ?? Date(), count: 2342),
       MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -7, to: Date()) ?? Date(), count: 5686)
        
       
    ]
    
    
    @Published var oneWeekAverage = 0
    @Published var oneWeekTotal = 0
    
    @Published var mockOneMonthData = [DailyStepModel]()
    @Published var oneMonthAverage = 0
    @Published var oneMonthTotal = 0
    
    @Published var mockThreeMonthData = [DailyStepModel]()
    @Published var threeMonthAverage = 0
    @Published var threeMonthTotal = 0
    
    @Published var ytdAverage = 0
    @Published var ytdTotal = 0
    
    @Published var oneYearAverage = 0
    @Published var oneYearTotal = 0
    
    
    
    
    init() {
        var mockOneMonth = mockDataForDays(days: 30)
        var mockThreeMonth = mockDataForDays(days: 90)
        
        DispatchQueue.main.async {
            self.mockOneMonthData = mockOneMonth
            self.mockThreeMonthData = mockThreeMonth
        }
        
        
    }
    
    
    func mockDataForDays(days: Int) -> [DailyStepModel] {
        var mockData = [DailyStepModel]()
        for day in 0..<days {
            let currentDate = Calendar.current.date(byAdding: .day, value: -day, to: Date()) ?? Date()
            let randomStepCounter = Int.random(in: 500...15000)
            let dailyStepData = DailyStepModel(date: currentDate, count: randomStepCounter)
            mockData.append(dailyStepData)
        }
        return mockData
    }
    
}