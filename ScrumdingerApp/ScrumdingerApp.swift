//
//  ScrumdingerAppApp.swift
//  ScrumdingerApp
//
//  Created by Parth Joshi on 11/13/23.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    
    var body: some Scene {
        /// WindowGroup is one of the primitive scenes that SwiftUI provides. In iOS, the views you add to the WindowGroup scene builder are presented in a window that fills the device’s entire screen.
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
