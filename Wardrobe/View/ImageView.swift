//
//  ImageView.swift
//  Wardrobe
//
//  Created by Michael Kilgore on 8/20/21.
//

import SwiftUI

struct ImageView: View {
    // MARK: - PROPERTY

    let image: Image
    @State var deleteMode: Bool
    @Binding var clothesDisplayed: ClothesDisplayed
    let index: Int
    
    // MARK: - FUNCTION
    
    
    // MARK: - BODY
    var body: some View {
        //Group {
            image
                .resizable()
                .scaledToFill()
                //.scaleEffect(0.5)
                .cornerRadius(12)
                //.background(Color.accentColor)
        //} //: GROUP
        //.cornerRadius(12)
        //.shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
    }
}

/*Hats: [ClothingPiece] = [ClothingPiece]()
 var Jewelery: [ClothingPiece] = [ClothingPiece]()
 var Shirts: [ClothingPiece] = [ClothingPiece]()
 var Pants: [ClothingPiece] = [ClothingPiece]()
 var Socks: [ClothingPiece] = [ClothingPiece]()
 var Shoes*/

// MARK: - PREVIEW
struct ImageView_Previews: PreviewProvider {
    @State static var clothes: ClothesDisplayed = ClothesDisplayed()
    
    static var previews: some View {
        ImageView(image: Image("testImage"), deleteMode: true, clothesDisplayed: $clothes, index: 0)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
