//
//  Workout_LogApp.swift
//  Workout Log
//
//  Created by Khalid Talakshi on 2023-06-21.
//

import SwiftUI

@main
struct Workout_LogApp: App {
    @StateObject var exerciseStore = ExerciseStore()
    
    var body: some Scene {
        WindowGroup {
            ExercisesView(exercises: $exerciseStore.exercises) {
                Task {
                    try await exerciseStore.save(exercises: exerciseStore.exercises)
                }
            }
            .task {
                do {
                    try await exerciseStore.load()
                } catch {
                    exerciseStore.exercises = Exercise.sampleExercises
                }
            }
        }
    }
}
