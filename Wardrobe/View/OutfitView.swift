//
//  OutfitView.swift
//  Wardrobe
//
//  Created by Michael Kilgore on 9/6/21.
//

import SwiftUI

struct OutfitView: View {
    // MARK: - PROPERTY
    
    @Environment(\.colorScheme) var colorScheme
    
    let outfitName: String
    let images: [Image]
    
    var numRows: Int {
        let numImages: Int = images.count
        let numRows: Double = Double(numImages/3)
        return Int(floor(numRows)) + 1
    }
    
    // MARK: - BODY
    var body: some View {
        VStack {
            HStack {
                Text(outfitName)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                Spacer()
                Text("Equip")
                    .font(.title2)
                    .fontWeight(.heavy)
                    .padding(.vertical, 25)
                    .padding(.horizontal, 10)
                    .background(
                        Capsule()
                            .fill(Color.green)
                            .frame(width: 100, height: 50)
                    )
            }
            ForEach(0..<numRows) { i in
                HStack {
                    ForEach(0..<3) { j in
                        if i*3 + j < images.count {
                            Spacer()
                            images[i*3 + j]
                                .resizable()
                                .frame(width: 80, height: 80)
                                .cornerRadius(12)
                                .padding(3)
                                .overlay(
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(colorScheme == .dark ? Color.white : Color.black, lineWidth: 2)
                                    )
                            Spacer()
                        } // IF
                    } // LOOP
                } // HSTACK
                .padding(.bottom, 5)
            } // LOOP
        } //: VSTACK
    }
}

// MARK: - PREVIEW
struct OutfitView_Previews: PreviewProvider {
    static var previews: some View {
        OutfitView(outfitName: "Cool Green Outfit", images: [Image("testImage"), Image("testImage"), Image("testImage"), Image("testImage"), Image("testImage"), Image("testImage"), Image("testImage"), Image("testImage")])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
