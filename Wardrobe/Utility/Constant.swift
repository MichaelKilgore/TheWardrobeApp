//
//  Constant.swift
//  Wardrobe
//
//  Created by Michael Kilgore on 8/20/21.
//

import SwiftUI

// MARK: - UI


// MARK: - UX

let feedback = UINotificationFeedbackGenerator()

// MARK: - LAYOUT

let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10

var oneGridLayout: [GridItem] {
    return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 1)
}
var twoGridLayout: [GridItem] {
    return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
}

var gridLayout: [GridItem] {
    return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 3)
}



// MARK: - STATIC FILTER REFERENCE ARRAYS
//("black", "white", "gray", "silver", "maroon", "red", "purple", "fushsia", "green", "lime", "olive", "yellow", "navy", "blue", "teal", and "aqua")
let colors: [Color] = [.black, .white, .green, .yellow, .blue]
let colorNames: [String] = ["black", "gray", "silver", "maroon", "red", "purple", "fushsia", "green", "lime", "olive", "yellow", "navy", "blue", "teal", "aqua"]
let types: [String] = ["Hat", "Glasses", "Jewelry", "Scarf", "Jacket", "Shirt", "Bra", "Belt", "Pants", "Shorts", "Underwear", "Socks", "Shoes", "Misc"]
let attireTypes: [String] = ["Formal", "Casual", "Sleep Wear", "Swim Wear", "Cozy", "Night Out", "Night In", "Costume"]
let staticTemps: [String] = ["Cold", "Moderate", "Hot"]

// MARK: - FORMATTER

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()
