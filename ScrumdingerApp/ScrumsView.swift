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
        /// [List](https://developer.apple.com/documentation/swiftui/list)
        List(scrums) { scrum in
            CardView(scrum: scrum)
                .listRowBackground(scrum.theme.mainColor)
        }
    }
}

#Preview {
    ScrumsView(scrums: DailyScrum.sampleData)
}
