//
//  BlankView.swift
//  Wardrobe
//
//  Created by Michael Kilgore on 9/6/21.
//

import SwiftUI

struct BlankView: View {
    // MARK: - PROPERTY

    var backgroundColor: Color
    var backgroundOpacity: Double
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .center)
        .background(backgroundColor)
        .opacity(backgroundOpacity)
        .blendMode(.overlay)
        .edgesIgnoringSafeArea(.all)
    }
}

// MARK: - PREVIEW

struct BlankView_Previews: PreviewProvider {
    static var previews: some View {
        BlankView(backgroundColor: Color.black, backgroundOpacity: 0.3)
            //.background(BackgroundImageView())
            //.background(backgroundGradient.ignoresSafeArea(.all))
    }
}
