//
//  DetailView.swift
//  ScrumdingerApp
//
//  Created by Parth Joshi on 11/15/23.
//

import SwiftUI

struct DetailView: View {
    let scrum: DailyScrum
    var body: some View {
        List {
            /// Sections create visual distinctions within your list. They help you to chunk content and establish groups in the information hierarchy of the list view.
            Section(header: Text("Meeting Info")) {
                /// Adding NavigationLink wraps the label in a gesture recognizer so that users can tap this row to transition to the meeting timer screen.
                NavigationLink(destination: MeetingView()) {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                HStack {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.theme.name)
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                }
                .accessibilityElement(children: .combine)
            }
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Label(attendee.name, systemImage: "person")
                }
            }
        }
        .navigationTitle(scrum.title)
    }
}

#Preview {
    NavigationStack {
        DetailView(scrum: DailyScrum.sampleData[0])
    }
}
