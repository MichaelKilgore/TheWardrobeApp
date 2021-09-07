//
//  ClothingPieceDisplayed.swift
//  Wardrobe
//
//  Created by Michael Kilgore on 8/30/21.
//

import SwiftUI

struct ClothingPiece: Identifiable {
    let id: UUID = UUID()
    var image: Image = Image("")
    var idOfWardrobeItem: UUID = UUID()
}
