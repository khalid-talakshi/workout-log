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
    @State var isPresentingNewExerciseView = false
    
    let saveAction: () -> Void
    
    var alphabeticalExericses: [Binding<Exercise>] {
        $exercises.sorted {$x, $y in
            x.name < y.name
        }
    }
    
    var reverseAlphabeticalExercises: [Binding<Exercise>] {
        $exercises.sorted { $x, $y in
            x.name > y.name
        }
    }
    
    var categoryExercises: [Binding<Exercise>] {
        $exercises.sorted {$x, $y in
            x.category.name < y.category.name
        }
    }
    
    var exerciseList: [Binding<Exercise>] {
        switch sortOption {
        case .alphabetical: return alphabeticalExericses
        case .reverseAlphabetical: return reverseAlphabeticalExercises
        case .type: return categoryExercises
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("Sort by", selection: $sortOption) {
                    Text("A-Z").tag(ExerciseSortOption.alphabetical)
                    Text("Z-A").tag(ExerciseSortOption.reverseAlphabetical)
                    Text("Category").tag(ExerciseSortOption.type)
                }.pickerStyle(.segmented)
                    .padding(.horizontal)
                switch(sortOption) {
                case .alphabetical:
                    List(alphabeticalExericses) {$exercise in
                        NavigationLink(destination: ExerciseDetailView(exercise: $exercise)) {
                            Label(exercise.name, systemImage: exercise.category.icon)
                        }
                    }
                case .reverseAlphabetical:
                    List(reverseAlphabeticalExercises) {$exercise in
                        NavigationLink(destination: ExerciseDetailView(exercise: $exercise)) {
                            Label(exercise.name, systemImage: exercise.category.icon)
                        }
                    }
                case .type:
                    ExerciseCategoryListView(exercises: $exercises)
                }
            }
            .navigationTitle("Exercises")
            .toolbar {
                Button(action: {
                    isPresentingNewExerciseView = true
                }) {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $isPresentingNewExerciseView) {
                AddExerciseView(isPresenting: $isPresentingNewExerciseView, exercises: $exercises)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView(exercises: .constant(Exercise.sampleExercises), saveAction: {})
    }
}
