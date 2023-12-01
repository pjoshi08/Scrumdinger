//
//  MeetingHeaderView.swift
//  ScrumdingerApp
//
//  Created by Parth Joshi on 11/20/23.
//

import SwiftUI

struct MeetingHeaderView: View {
    let secondsElapsed: Int
    let secondsRemaining: Int
    let theme: Theme
    
    private var totalSeconds: Int {
        secondsElapsed + secondsRemaining
    }
    private var progress: Double {
        return Double(secondsElapsed) / Double(totalSeconds)
    }
    private var minutesRemaining: Int {
        return secondsRemaining / 60
    }
    
    var body: some View {
        VStack {
            ProgressView(value: progress)
                .progressViewStyle(ScrumProgressViewStyle(theme: theme))
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    /// The image uses one of the included [SF Symbols 4](https://developer.apple.com/sf-symbols/). The system treats these symbols like fonts, so they scale dynamically with a user’s device settings.
                    Label("\(secondsElapsed)", systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("\(secondsRemaining)", systemImage: "hourglass.bottomhalf.fill")
                        .labelStyle(.trailingIcon)
                }
            }
        }
        .accessibilityElement(children: /*@START_MENU_TOKEN@*/.ignore/*@END_MENU_TOKEN@*/)
        .accessibilityLabel("Time Remaining")
        .accessibilityValue("\(minutesRemaining) minutes")
        .padding([.top, .horizontal])
    }
}

#Preview {
    MeetingHeaderView(secondsElapsed: 60, secondsRemaining: 100, theme: .bubblegum)
        .previewLayout(.sizeThatFits)
}
