//
//  DataStore.swift
//  Workout Log
//
//  Created by Khalid Talakshi on 2023-06-22.
//

import SwiftUI

@MainActor
class ExerciseStore: ObservableObject {
    @Published var exercises: [Exercise] = []
    
    private static func fileUrl() throws -> URL {
        try FileManager.default.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: false)
        .appendingPathComponent("scurms.data")
    }
    
    func load() async throws {
        let task = Task<[Exercise], Error> {
            let fileUrl = try Self.fileUrl()
            guard let data = try? Data(contentsOf: fileUrl) else {
                return []
            }
            let exercises = try JSONDecoder().decode([Exercise].self, from: data)
            return exercises
        }
        let exercises = try await task.value
        self.exercises = exercises
    }
    
    func save(exercises: [Exercise]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(exercises)
            let outfile = try Self.fileUrl()
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
}
