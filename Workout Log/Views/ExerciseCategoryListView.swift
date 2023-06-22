//
//  ExerciseCategoryListView.swift
//  Workout Log
//
//  Created by Khalid Talakshi on 2023-06-22.
//

import SwiftUI

struct ExerciseCategoryListView: View {
    @Binding var exercises: [Exercise]
    
    func filterList(category: ExcerciseType) -> [Exercise] {
        return exercises.filter {
            $0.category == category
        }
    }
    
    var body: some View {
        List {
            ForEach(ExcerciseType.allCases, id: \.rawValue) {category in
                Section(header: Text(category.name)) {
                    ForEach(filterList(category: category)) { exercise in
                        Label(exercise.name, systemImage: category.icon)
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
