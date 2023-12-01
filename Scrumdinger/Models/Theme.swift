//
//  Theme.swift
//  ScrumdingerApp
//
//  Created by Parth Joshi on 11/13/23.
//

import SwiftUI

/// Codable is a type alias that combines the Encodable and Decodable protocols. When you implement these protocols on your types, you can use the Codable API to easily serialize data to and from JSON.
/// Many types in the standard library and Foundation, like UUID, Date, and Int, are already Codable. You can adopt Codable in your own custom type by using types that are already Codable for all of its stored properties and declaring the type Codable.
enum Theme: String, CaseIterable, Identifiable, Codable {
    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow
    
    var accentColor: Color {
        switch self {
        case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow: return .black
        case .indigo, .magenta, .navy, .oxblood, .purple: return .white
        }
    }
    var mainColor: Color {
        Color(rawValue)
    }
    var name: String {
        rawValue.capitalized
    }
    var id: String {
        name
    }
}


