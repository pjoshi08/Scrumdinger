//
//  NewScrumSheet.swift
//  ScrumdingerApp
//
//  Created by Parth Joshi on 11/23/23.
//

import SwiftUI

struct NewScrumSheet: View {
    /// NewScrumSheet owns the source of truth for newScrum and passes a binding to DetailEditView.
    //@State private var newScrum = DailyScrum.emptyScrum
    @Binding var newScrumData: DailyScrum.Data
    @Binding var scrums: [DailyScrum]
    @Binding var isPresentingNewScrumView: Bool
    
    var body: some View {
        NavigationStack {
            DetailEditView(data: $newScrumData)
                .toolbar{
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewScrumView = false
                            newScrumData = DailyScrum.Data()
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            let newScrum = DailyScrum(data: newScrumData)
                            scrums.append(newScrum)
                            isPresentingNewScrumView = false
                            newScrumData = DailyScrum.Data()
                        }
                    }
                }
        }
    }
}

#Preview {
    NewScrumSheet(newScrumData: .constant(DailyScrum.sampleData[0].data),
                  scrums: .constant(DailyScrum.sampleData),
                  isPresentingNewScrumView: .constant(true))
}
