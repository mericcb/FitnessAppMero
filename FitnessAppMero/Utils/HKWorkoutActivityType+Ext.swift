//
//  HKWorkoutActivityType+Ext.swift
//  FitnessAppMero
//
//  Created by Meriç Cem Baysar on 23.07.2024.
//

import HealthKit
import SwiftUI


extension HKWorkoutActivityType {

    /*
     Simple mapping of available workout types to a human readable name.
     */
    var name: String {
        switch self {
        case .americanFootball:             return "American Football"
        case .archery:                      return "Archery"
        case .australianFootball:           return "Australian Football"
        case .badminton:                    return "Badminton"
        case .baseball:                     return "Baseball"
        case .basketball:                   return "Basketball"
        case .bowling:                      return "Bowling"
        case .boxing:                       return "Boxing"
        case .climbing:                     return "Climbing"
        case .crossTraining:                return "Cross Training"
        case .curling:                      return "Curling"
        case .cycling:                      return "Cycling"
        case .dance:                        return "Dance"
        case .danceInspiredTraining:        return "Dance Inspired Training"
        case .elliptical:                   return "Elliptical"
        case .equestrianSports:             return "Equestrian Sports"
        case .fencing:                      return "Fencing"
        case .fishing:                      return "Fishing"
        case .functionalStrengthTraining:   return "Functional Strength Training"
        case .golf:                         return "Golf"
        case .gymnastics:                   return "Gymnastics"
        case .handball:                     return "Handball"
        case .hiking:                       return "Hiking"
        case .hockey:                       return "Hockey"
        case .hunting:                      return "Hunting"
        case .lacrosse:                     return "Lacrosse"
        case .martialArts:                  return "Martial Arts"
        case .mindAndBody:                  return "Mind and Body"
        case .mixedMetabolicCardioTraining: return "Mixed Metabolic Cardio Training"
        case .paddleSports:                 return "Paddle Sports"
        case .play:                         return "Play"
        case .preparationAndRecovery:       return "Preparation and Recovery"
        case .racquetball:                  return "Racquetball"
        case .rowing:                       return "Rowing"
        case .rugby:                        return "Rugby"
        case .running:                      return "Running"
        case .sailing:                      return "Sailing"
        case .skatingSports:                return "Skating Sports"
        case .snowSports:                   return "Snow Sports"
        case .soccer:                       return "Soccer"
        case .softball:                     return "Softball"
        case .squash:                       return "Squash"
        case .stairClimbing:                return "Stair Climbing"
        case .surfingSports:                return "Surfing Sports"
        case .swimming:                     return "Swimming"
        case .tableTennis:                  return "Table Tennis"
        case .tennis:                       return "Tennis"
        case .trackAndField:                return "Track and Field"
        case .traditionalStrengthTraining:  return "Traditional Strength Training"
        case .volleyball:                   return "Volleyball"
        case .walking:                      return "Walking"
        case .waterFitness:                 return "Water Fitness"
        case .waterPolo:                    return "Water Polo"
        case .waterSports:                  return "Water Sports"
        case .wrestling:                    return "Wrestling"
        case .yoga:                         return "Yoga"

        // iOS 10
        case .barre:                        return "Barre"
        case .coreTraining:                 return "Core Training"
        case .crossCountrySkiing:           return "Cross Country Skiing"
        case .downhillSkiing:               return "Downhill Skiing"
        case .flexibility:                  return "Flexibility"
        case .highIntensityIntervalTraining:    return "High Intensity Interval Training"
        case .jumpRope:                     return "Jump Rope"
        case .kickboxing:                   return "Kickboxing"
        case .pilates:                      return "Pilates"
        case .snowboarding:                 return "Snowboarding"
        case .stairs:                       return "Stairs"
        case .stepTraining:                 return "Step Training"
        case .wheelchairWalkPace:           return "Wheelchair Walk Pace"
        case .wheelchairRunPace:            return "Wheelchair Run Pace"

        // iOS 11
        case .taiChi:                       return "Tai Chi"
        case .mixedCardio:                  return "Mixed Cardio"
        case .handCycling:                  return "Hand Cycling"

        // iOS 13
        case .discSports:                   return "Disc Sports"
        case .fitnessGaming:                return "Fitness Gaming"

        // Catch-all
        default:                            return "Other"
        }
    }
    
    
    var image: String {
        let symbolName : String
        switch self {
        case .americanFootball:             symbolName = "football"
        case .archery:                      symbolName = "arrow.up.and.line.horizontal"
        case .australianFootball:           symbolName = "football.circle"
        case .badminton:                    symbolName = "figure.badminton"
        case .baseball:                     symbolName = "baseball"
        case .basketball:                   symbolName = "basketball"
        case .bowling:                      symbolName = "figure.bowling"
        case .boxing:                       symbolName = "figure.boxing"
        case .climbing:                     symbolName = "figure.climbing"
        case .crossTraining:                symbolName = "figure.cross.training"
        case .curling:                      symbolName = "figure.curling"
        case .cycling:                      symbolName = "bicycle"
        case .dance:                        symbolName = "figure.dance"
        case .danceInspiredTraining:        symbolName = "figure.dance"
        case .elliptical:                   symbolName = "figure.elliptical"
        case .equestrianSports:             symbolName = "figure.equestrian.sports"
        case .fencing:                      symbolName = "figure.fencing"
        case .fishing:                      symbolName = "fish"
        case .functionalStrengthTraining:   symbolName = "figure.strengthtraining.functional"
        case .golf:                         symbolName = "figure.golf"
        case .gymnastics:                   symbolName = "figure.gymnastics"
        case .handball:                     symbolName = "figure.handball"
        case .hiking:                       symbolName = "figure.hiking"
        case .hockey:                       symbolName = "hockey.puck"
        case .hunting:                      symbolName = "scope"
        case .lacrosse:                     symbolName = "figure.lacrosse"
        case .martialArts:                  symbolName = "figure.martial.arts"
        case .mindAndBody:                  symbolName = "brain.head.profile"
        case .mixedMetabolicCardioTraining: symbolName = "figure.mixed.cardio"
        case .paddleSports:                 symbolName = "figure.rowing"
        case .play:                         symbolName = "play"
        case .preparationAndRecovery:       symbolName = "figure.cooldown"
        case .racquetball:                  symbolName = "figure.racquetball"
        case .rowing:                       symbolName = "figure.rower"
        case .rugby:                        symbolName = "rugby.ball"
        case .running:                      symbolName = "figure.run"
        case .sailing:                      symbolName = "sailboat"
        case .skatingSports:                symbolName = "figure.skating"
        case .snowSports:                   symbolName = "snowflake"
        case .soccer:                       symbolName = "figure.soccer"
        case .softball:                     symbolName = "baseball"
        case .squash:                       symbolName = "figure.squash"
        case .stairClimbing:                symbolName = "figure.stairs"
        case .surfingSports:                symbolName = "figure.surfing"
        case .swimming:                     symbolName = "figure.pool.swim"
        case .tableTennis:                  symbolName = "figure.table.tennis"
        case .tennis:                       symbolName = "tennis.racket"
        case .trackAndField:                symbolName = "figure.track.and.field"
        case .traditionalStrengthTraining:  symbolName = "figure.strengthtraining.traditional"
        case .volleyball:                   symbolName = "volleyball"
        case .walking:                      symbolName = "figure.walk"
        case .waterFitness:                 symbolName = "figure.water.fitness"
        case .waterPolo:                    symbolName = "figure.water.polo"
        case .waterSports:                  symbolName = "figure.open.water.swim"
        case .wrestling:                    symbolName = "figure.wrestling"
        case .yoga:                         symbolName = "figure.yoga"
        case .barre:                        symbolName = "figure.barre"
        case .coreTraining:                 symbolName = "figure.core.training"
        case .crossCountrySkiing:           symbolName = "figure.skiing.crosscountry"
        case .downhillSkiing:               symbolName = "figure.skiing.downhill"
        case .flexibility:                  symbolName = "figure.flexibility"
        case .highIntensityIntervalTraining: symbolName = "figure.hiit"
        case .jumpRope:                     symbolName = "figure.jumprope"
        case .kickboxing:                   symbolName = "figure.kickboxing"
        case .pilates:                      symbolName = "figure.pilates"
        case .snowboarding:                 symbolName = "snowboard"
        case .stairs:                       symbolName = "stairs"
        case .stepTraining:                 symbolName = "figure.step.training"
        case .wheelchairWalkPace:           symbolName = "figure.roll.runningpace"
        case .wheelchairRunPace:            symbolName = "figure.roll"
        case .taiChi:                       symbolName = "figure.taichi"
        case .mixedCardio:                  symbolName = "figure.mixed.cardio"
        case .handCycling:                  symbolName = "figure.hand.cycling"
        case .discSports:                   symbolName = "frisbee"
        case .fitnessGaming:                symbolName = "gamecontroller"
        default:                            symbolName = "figure.other"
        }
        return symbolName
    }
    
    var color: Color {
        let defaultColor = Color.black
        switch self {
        case .americanFootball, .archery, .australianFootball:
            return Color.red
        case .badminton, .baseball, .basketball:
            return Color.blue
        case .bowling, .boxing, .climbing:
            return Color.green
        case .crossTraining, .curling, .cycling:
            return Color.orange
        case .dance, .danceInspiredTraining, .elliptical:
            return Color.yellow
        case .equestrianSports, .fencing, .fishing:
            return Color.purple
        case .functionalStrengthTraining, .golf, .gymnastics:
            return Color.pink
        case .handball, .hiking, .hockey:
            return Color.teal
        case .hunting, .lacrosse, .martialArts:
            return Color.indigo
        case .mindAndBody, .mixedMetabolicCardioTraining, .paddleSports:
            return Color.brown
        case .play, .preparationAndRecovery, .racquetball:
            return Color.mint
        case .rowing, .rugby, .running:
            return Color.cyan
        case .sailing, .skatingSports, .snowSports:
            return Color.gray.opacity(0.8)  // darkGray yerine
        case .soccer, .softball, .squash:
            return Color.gray.opacity(0.3)  // lightGray yerine
        case .stairClimbing, .surfingSports, .swimming:
            return Color.gray
        case .tableTennis, .tennis, .trackAndField:
            return Color.gray.opacity(0.7)
        case .traditionalStrengthTraining, .volleyball, .walking:
            return Color.gray.opacity(0.6)
        case .waterFitness, .waterPolo, .waterSports:
            return Color.gray.opacity(0.5)
        case .wrestling, .yoga, .barre:
            return Color.gray.opacity(0.4)
        case .coreTraining, .crossCountrySkiing, .downhillSkiing:
            return Color.gray.opacity(0.2)
        case .flexibility, .highIntensityIntervalTraining, .jumpRope:
            return Color.red
        case .kickboxing, .pilates, .snowboarding:
            return Color.blue
        case .stairs, .stepTraining, .wheelchairWalkPace:
            return Color.green
        case .wheelchairRunPace, .taiChi, .mixedCardio:
            return Color.yellow
        case .handCycling, .discSports, .fitnessGaming:
            return Color(red: 1, green: 0, blue: 1)  // magenta yerine
        default:
            return defaultColor
        }
    }

}
