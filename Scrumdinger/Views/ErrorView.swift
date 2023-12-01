//
//  ErrorView.swift
//  ScrumdingerApp
//
//  Created by Parth Joshi on 11/28/23.
//

import SwiftUI

struct ErrorView: View {
    let errorWrapper: ErrorWrapper
    /// With the @Environment property wrapper, you can read a value that the view’s environment stores, such as the view’s presentation mode, scene phase, visibility, or color scheme. In this case, you’ll access the view’s dismiss structure and call it like a function to dismiss the view.
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("An error has occurred!")
                    .font(.title)
                    .padding(.bottom)
                Text(errorWrapper.error.localizedDescription)
                    .font(.headline)
                Text(errorWrapper.guidance)
                    .font(.caption)
                    .padding(.top)
                Spacer()
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(16)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Dismiss") {
                        /// dismiss is a structure. You can call a structure like a function if it includes callAsFunction().
                        dismiss()
                    }
                }
            }
        }
    }
}

//#Preview {
//    enum SampleError: Error {
//        case errorRequired
//    }
//    
//    var wrapper: ErrorWrapper {
//        ErrorWrapper(error: SampleError.errorRequired,
//                     guidance: "You can safely ignore this error.")
//    }
//    
//    ErrorView(errorWrapper: wrapper)
//}

struct ErrorView_Previews: PreviewProvider {
    enum SampleError: Error {
        case errorRequired
    }
    
    static var wrapper: ErrorWrapper {
        ErrorWrapper(error: SampleError.errorRequired,
                     guidance: "You can safely ignore this error.")
    }
    
    static var previews: some View {
        ErrorView(errorWrapper: wrapper)
    }
}
