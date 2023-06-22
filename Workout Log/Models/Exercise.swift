//
//  Exercise.swift
//  Workout Log
//
//  Created by Khalid Talakshi on 2023-06-21.
//

import Foundation

struct Exercise: Identifiable {
    var id: UUID
    var name: String
    var category: ExcerciseType
    
    init(id: UUID = UUID(), name: String, category: ExcerciseType) {
        self.id = id
        self.name = name
        self.category = category
    }
}

extension Exercise {
    static let sampleExercises = [
        Exercise(name: "Bench Press", category: .weightlifting),
        Exercise(name: "Rope Pull", category: .hiit),
        Exercise(name: "Treadmill", category: .cardio)
    ]
}
