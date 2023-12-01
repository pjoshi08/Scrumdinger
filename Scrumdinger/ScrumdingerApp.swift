//
//  ScrumdingerApp.swift
//  ScrumdingerApp
//
//  Created by Parth Joshi on 11/13/23.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    // @State private var scrums = DailyScrum.sampleData
    @StateObject private var store = ScrumStore()
    /// Default va;lue of an optional is nil
    @State private var errorWrapper: ErrorWrapper?
    
    var body: some Scene {
        /// WindowGroup is one of the primitive scenes that SwiftUI provides. In iOS, the views you add to the WindowGroup scene builder are presented in a window that fills the device’s entire screen.
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $store.scrums) {
                    Task {
                        do {
                            try await store.save(scrums: store.scrums)
                        } catch {
                            errorWrapper = ErrorWrapper(error: error, guidance: "Try again later.")
                        }
                    }
                }
                .task {
                    do {
                        try await store.load()
                    } catch {
                        errorWrapper = ErrorWrapper(error: error,
                                                    guidance: "Scrumdinger will load sample data and continue.")
                    }
                }
                /// The modal sheet provides a closure to execute code when the user dismisses the modal sheet, and a closure to supply a view to present modally.
                .sheet(item: $errorWrapper) {
                    /// Because you provide a binding to the condition that initiates the presentation, SwiftUI resets the optional error wrapper to nil when the user dismisses the presentation.
                    store.scrums = DailyScrum.sampleData
                } content: { wrapper in
                    ErrorView(errorWrapper: wrapper)
                }
            }
        }
    }
}

/// 1. Challenge yourself to add a new feature to Scrumdinger. Try using [EventKit](https://developer.apple.com/documentation/eventkit) to schedule meetings and receive reminders that sync with Calendar. Or consider how you can adapt Scrumdinger to build an app of your own, like an interval stopwatch.
/// 2. Explore [Apple Developer Documentation](https://developer.apple.com/documentation), and browse through the comprehensive API reference library and sample code projects to find inspiration for your next project.
/// 3. [Developer Forums](https://developer.apple.com/forums/tags/swiftui)
/// 4. [Managing Model data](https://developer.apple.com/documentation/swiftui/managing-model-data-in-your-app)
/// 5. [App Essentials: SwiftUI](https://developer.apple.com/videos/play/wwdc2020/10037/)
/// 6. [Demystify SwiftUI](https://developer.apple.com/videos/play/wwdc2021/10022/)
