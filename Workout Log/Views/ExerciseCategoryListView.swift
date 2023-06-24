//
//  ExerciseCategoryListView.swift
//  Workout Log
//
//  Created by Khalid Talakshi on 2023-06-22.
//

import SwiftUI

struct ExerciseCategoryListView: View {
    @Binding var exercises: [Exercise]
    
    func filterList(category: ExcerciseType) -> [Binding<Exercise>] {
        return $exercises.filter {$exercise in
            exercise.category == category
        }
    }
    
    var body: some View {
        List {
            ForEach(ExcerciseType.allCases, id: \.rawValue) {category in
                if (filterList(category: category).count > 0) {
                    Section(header: Text(category.name)) {
                        ForEach(filterList(category: category)) { $exercise in
                            NavigationLink(destination: ExerciseDetailView(exercise: $exercise)) {
                                Label(exercise.name, systemImage: category.icon)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ExerciseCategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseCategoryListView(exercises: .constant(Exercise.sampleExercises))
            .previewLayout(.sizeThatFits)
    }
}
