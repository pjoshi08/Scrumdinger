//
//  ScrumsView.swift
//  ScrumdingerApp
//
//  Created by Parth Joshi on 11/14/23.
//

import SwiftUI

struct ScrumsView: View {
    let scrums: [DailyScrum]
    
    var body: some View {
        /// The list of scrums acts as the root view and is always present. Selecting a navigation link from the list adds a scrum detail view to the stack so that it covers the list. Navigating back removes the detail view and reveals the list again. The system disables backward navigation controls when the list of scrums is the only view in the stack.
        NavigationStack {
            /// [List](https://developer.apple.com/documentation/swiftui/list)
            List(scrums) { scrum in
                NavigationLink(destination: DetailView(scrum: scrum)) {
                    CardView(scrum: scrum)
                    
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums") /// Notice that you add the .navigationTitle modifier to the List. The child view can affect the appearance of the NavigationStack using modifiers.
            .toolbar {
                Button(action: {}) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
        }
    }
}

#Preview {
    ScrumsView(scrums: DailyScrum.sampleData)
}
