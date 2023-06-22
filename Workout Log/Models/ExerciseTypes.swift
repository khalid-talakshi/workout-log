//
//  ExerciseTypes.swift
//  Workout Log
//
//  Created by Khalid Talakshi on 2023-06-21.
//

import Foundation

enum ExcerciseType: String, CaseIterable, Codable {
    case weightlifting
    case hiit
    case cardio
    
    var icon: String {
        switch self {
        case .weightlifting: return "figure.strengthtraining.traditional"
        case .hiit: return "figure.jumprope"
        case .cardio: return "figure.run"
        }
    }
    
    var name: String {
        rawValue.capitalized
    }
}
