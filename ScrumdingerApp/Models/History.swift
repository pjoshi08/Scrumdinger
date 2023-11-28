//
//  History.swift
//  ScrumdingerApp
//
//  Created by Parth Joshi on 11/25/23.
//

import Foundation

/// The array of DailyScrum items in ScrumdingerApp is the source of truth for the app’s data. ScrumsView has a binding to the array, and it passes a binding to an individual item in the array to DetailView. The detail view passes the binding to MeetingView. Bindings keep your model data in sync with a single source of truth, so all your views reflect the same data.
struct History: Identifiable, Codable {
    let id: UUID
    let date: Date
    var attendees: [DailyScrum.Attendee]
    
    init(id: UUID = UUID(), date: Date = Date(), attendees: [DailyScrum.Attendee]) {
        self.id = id
        self.date = date
        self.attendees = attendees
    }
}
