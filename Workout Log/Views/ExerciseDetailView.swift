//
//  ExerciseDetailView.swift
//  Workout Log
//
//  Created by Khalid Talakshi on 2023-06-24.
//

import SwiftUI

struct ExerciseDetailView: View {
    @Binding var exercise: Exercise
    
    @State var editingExercise: Exercise = Exercise.emptyExercise
    @State var isPresentingSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Details")) {
                    HStack {
                        Text("Category")
                        Spacer()
                        Label(exercise.category.name, systemImage: exercise.category.icon)
                    }
                }
            }
            .navigationTitle(exercise.name)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Edit") {
                        editingExercise = exercise
                        isPresentingSheet = true
                    }
                }
            }
            .sheet(isPresented: $isPresentingSheet) {
                NavigationStack {
                    ExerciseFormView(exercise: $editingExercise)
                        .toolbar {
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Save") {
                                    exercise = editingExercise
                                    isPresentingSheet = false
                                }
                            }
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cancel") {
                                    isPresentingSheet = false
                                }
                            }
                        }
                        .navigationTitle("Edit \(editingExercise.name)")
                }
            }
        }
    }
}

struct ExerciseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseDetailView(exercise: .constant(Exercise.sampleExercises[0]))
    }
}
