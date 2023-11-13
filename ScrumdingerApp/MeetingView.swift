//
//  ContentView.swift
//  ScrumdingerApp
//
//  Created by Parth Joshi on 11/13/23.
//

import SwiftUI

struct MeetingView: View {
    var body: some View {
        VStack {
            ProgressView(value: 10, total: 15)
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    /// The image uses one of the included [SF Symbols 4](https://developer.apple.com/sf-symbols/). The system treats these symbols like fonts, so they scale dynamically with a user’s device settings.
                    Label("300", systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("600", systemImage: "hourglass.bottomhalf.fill")
                }
            }
            .accessibilityElement(children: /*@START_MENU_TOKEN@*/.ignore/*@END_MENU_TOKEN@*/)
            .accessibilityLabel("Time Remaining")
            .accessibilityValue("10 minutes")
            Circle()
                .strokeBorder(lineWidth: 24)
            HStack {
                Text("Speaker 1 of 3")
                Spacer()
                Button(action: {}) {
                    Image(systemName: "forward.fill")
                }
                .accessibilityLabel("Next Speaker")
            }
        }
        .padding()
    }
}

#Preview {
    MeetingView()
}

//struct MeetingView_Previews: PreviewProvider {
//    static var previews: some View {
//        MeetingView()
//    }
//}
