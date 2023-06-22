//
//  AddExerciseView.swift
//  Workout Log
//
//  Created by Khalid Talakshi on 2023-06-22.
//

import SwiftUI

struct AddExerciseView: View {
    @Binding var isPresenting: Bool
    @Binding var exercises: [Exercise]
    
    @State var newExercise = Exercise.emptyExercise
    
    var body: some View {
        NavigationStack {
            ExerciseFormView(exercise: $newExercise)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        isPresenting = false
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        exercises.append(newExercise)
                        isPresenting = false
                    }
                }
            }
            .navigationTitle("Add New Exercise")
        }
    }
}

struct AddExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExerciseView(isPresenting: .constant(true), exercises: .constant(Exercise.sampleExercises))
    }
}
