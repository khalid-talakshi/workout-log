//
//  ContentView.swift
//  Workout Log
//
//  Created by Khalid Talakshi on 2023-06-21.
//

import SwiftUI

struct ExercisesView: View {
    @Binding var exercises: [Exercise]
    
    @State var sortOption = ExerciseSortOption.alphabetical
    
    var alphabeticalExericses: [Exercise] {
        exercises.sorted {
            $0.name < $1.name
        }
    }
    
    var reverseAlphabeticalExercises: [Exercise] {
        exercises.sorted {
            $0.name > $1.name
        }
    }
    
    var categoryExercises: [Exercise] {
        exercises.sorted {
            $0.category.name < $1.category.name
        }
    }
    
    var exerciseList: [Exercise] {
        switch sortOption {
        case .alphabetical: return alphabeticalExericses
        case .reverseAlphabetical: return reverseAlphabeticalExercises
        case .type: return categoryExercises
        }
    }
    
    var body: some View {
        VStack {
            Picker("Sort by", selection: $sortOption) {
                Text("A-Z").tag(ExerciseSortOption.alphabetical)
                Text("Z-A").tag(ExerciseSortOption.reverseAlphabetical)
                Text("Category").tag(ExerciseSortOption.type)
            }.pickerStyle(.segmented)
                .padding(.horizontal)
            if (sortOption == .type) {
                ExerciseCategoryListView(exercises: $exercises)
            } else {
                List(exerciseList) {exercise in
                    Label(exercise.name, systemImage: exercise.category.icon)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView(exercises: .constant(Exercise.sampleExercises))
    }
}
