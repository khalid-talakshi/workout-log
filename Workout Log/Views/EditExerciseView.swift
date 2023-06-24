//
//  EditExerciseView.swift
//  Workout Log
//
//  Created by Khalid Talakshi on 2023-06-22.
//

import SwiftUI

struct EditExerciseView: View {
    @Binding var exercise: Exercise
    @State var editExercise: Exercise = Exercise.emptyExercise
    
    var body: some View {
            ExerciseFormView(exercise: $exercise)
       
    }
}

struct EditExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        EditExerciseView(exercise: .constant(Exercise.sampleExercises[0]))
    }
}
