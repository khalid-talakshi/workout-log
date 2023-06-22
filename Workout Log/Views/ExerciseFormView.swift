//
//  ExerciseEditView.swift
//  Workout Log
//
//  Created by Khalid Talakshi on 2023-06-22.
//

import SwiftUI

struct ExerciseFormView: View {
    @Binding var exercise: Exercise
    
    var body: some View {
        Form {
            TextField("Name", text: $exercise.name)
            Picker("Category", selection: $exercise.category) {
                ForEach(ExcerciseType.allCases, id: \.rawValue) {category in
                    Text(category.name).tag(category)
                }
            }
        }
    }
}

struct ExerciseEditView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseFormView(exercise: .constant(Exercise.sampleExercises[0]))
    }
}
