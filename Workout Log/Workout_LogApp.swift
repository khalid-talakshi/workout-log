//
//  Workout_LogApp.swift
//  Workout Log
//
//  Created by Khalid Talakshi on 2023-06-21.
//

import SwiftUI

@main
struct Workout_LogApp: App {
    var body: some Scene {
        WindowGroup {
            ExercisesView(exercises: .constant(Exercise.sampleExercises))
        }
    }
}
