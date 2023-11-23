//
//  DetailView.swift
//  ScrumdingerApp
//
//  Created by Parth Joshi on 11/15/23.
//

import SwiftUI

struct DetailView: View {
    /// Using a binding ensures that DetailView renders again when the user’s interaction modifies scrum.
    @Binding var scrum: DailyScrum
    
    /// You’ll update this empty scrum to match the selected scrum when the user taps the Edit button.
    @State private var data = DailyScrum.Data()
    @State private var isPresentingEditView = false
    
    var body: some View {
        List {
            /// Sections create visual distinctions within your list. They help you to chunk content and establish groups in the information hierarchy of the list view.
            Section(header: Text("Meeting Info")) {
                /// Adding NavigationLink wraps the label in a gesture recognizer so that users can tap this row to transition to the meeting timer screen.
                NavigationLink(destination: MeetingView(scrum: $scrum)) {
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
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
                data = scrum.data
            }
        }
        /// Modal views remove users from the main navigation flow of the app. Use modality for short, self-contained tasks. For more information about the different types of modal presentation and when to use modality effectively in your apps, refer to [Modality](https://developer.apple.com/design/human-interface-guidelines/modality) in the Human Interface Guidelines.
        .sheet(isPresented: $isPresentingEditView) {
            NavigationStack {
                DetailEditView(data: $data)
                    .navigationTitle(scrum.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                                scrum.update(from: data)
                            }
                        }
                    }
            }
        }
    }
}

#Preview {
    NavigationStack {
        DetailView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}
