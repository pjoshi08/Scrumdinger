//
//  ScrumStore.swift
//  ScrumdingerApp
//
//  Created by Parth Joshi on 11/27/23.
//

import SwiftUI

/// ObservableObject is a class-constrained protocol for connecting external model data to SwiftUI views.
@MainActor
class ScrumStore: ObservableObject {
    /// An ObservableObject includes an objectWillChange publisher that emits when one of its @Published properties is about to change. Any view observing an instance of ScrumStore will render again when the scrums value changes.
    @Published var scrums: [DailyScrum] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("scrums.data")
    }
    
    func load() async throws {
        /// You store the task in a let constant so that later you can access values returned or catch errors thrown from the task.
        let task = Task<[DailyScrum], Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else { return [] }
            let dailyScrums = try JSONDecoder().decode([DailyScrum].self, from: data)
            return dailyScrums
        }
        /// If the JSONDecoder throws an error inside the task, the error will be propagated when you try to access the value property.
        let scrums = try await task.value
        self.scrums = scrums
    }
    
    func save(scrums: [DailyScrum]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(scrums)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
}
