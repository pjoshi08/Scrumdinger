//
//  TrailingIconLabelStyle.swift
//  ScrumdingerApp
//
//  Created by Parth Joshi on 11/14/23.
//

import SwiftUI

/// If you don’t want to create a custom label style, you can use one of the built-in label styles that display the icon, the title, or both using a system-standard layout.
struct TrailingIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            /// The configuration parameter is a LabelStyleConfiguration, which contains the icon and title views. These views represent the label’s image and label text.
            configuration.title
            configuration.icon
        }
    }
}

/// Add an extension on LabelStyle that creates a static property named trailingIcon.
extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: Self { Self() }
}
