//
//  DetailEditView.swift
//  ScrumdingerApp
//
//  Created by Parth Joshi on 11/18/23.
//

import SwiftUI

struct DetailEditView: View {
    /// @State property wrapper defines the source of truth for value types.
    @State private var scrum = DailyScrum.emptyScrum
    @State private var newAttendeeName = ""
    
    var body: some View {
        Form {
            Section(header: Text("Meeting Info")) {
                /// $ syntax creates a binding to the scrum.title. The current view manages the state of the data property.
                TextField("Title", text: $scrum.title)
                HStack {
                    Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1) {
                        Text("Length") /// accessibility use
                    }
                    .accessibilityValue("\(scrum.lengthInMinutes) minutes")
                    Spacer()
                    /// When the slider changes, you update a daily scrum state property that triggers a UI update. Because the text label displays the state property and the system automatically updates the views that depend on the state property, the slider and the label stay in sync.
                    Text("\(scrum.lengthInMinutes) minutes")
                        .accessibilityHidden(true)
                }
            }
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete { indices in
                    scrum.attendees.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Attendee", text: $newAttendeeName)
                    Button(action: {
                        withAnimation {
                            let attendee = DailyScrum.Attendee(name: newAttendeeName)
                            scrum.attendees.append(attendee)
                            newAttendeeName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add Attendee")
                    }
                    .disabled(newAttendeeName.isEmpty)
                }
            }
        }
    }
}

#Preview {
    DetailEditView()
}
