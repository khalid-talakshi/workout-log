//
//  RootView.swift
//  Workout Log
//
//  Created by Khalid Talakshi on 2023-06-24.
//

import SwiftUI

struct RootView: View {
    @Binding var exercises: [Exercise]
    
    @Environment(\.scenePhase) private var scenePhase
    
    let saveAction: () -> Void
    var body: some View {
        TabView {
            ExercisesView(exercises: $exercises, saveAction: saveAction)
                .tabItem {
                    Label("Exercises", systemImage: "dumbbell.fill")
                }
        }
        .onChange(of: scenePhase) {phase in
            if (phase == .inactive) { saveAction() }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(exercises: .constant(Exercise.sampleExercises), saveAction: {})
    }
}
