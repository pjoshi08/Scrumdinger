//
//  ThemePicker.swift
//  ScrumdingerApp
//
//  Created by Parth Joshi on 11/18/23.
//

import SwiftUI

struct ThemePicker: View {
    @Binding var selection: Theme
    
    var body: some View {
        Picker("Theme", selection: $selection) {
            ForEach(Theme.allCases) { theme in
                ThemeView(theme: theme)
                    .tag(theme) /// You can tag subviews when you need to differentiate among them in controls like pickers and lists. Tag values can be any hashable type like in an enumeration.
            }
        }
        /// When a user interacts with a navigation style picker, the system pushes the picker view onto the navigation stack. The picker view displays each theme in a ThemeView that highlights the theme’s color.
        .pickerStyle(.navigationLink)
    }
}

#Preview {
    /// You can use the constant(_:) type method to create a binding to a hard-coded, immutable value. Constant bindings are useful in previews or when prototyping your app’s user interface.
    ThemePicker(selection: .constant(.periwinkle))
}
