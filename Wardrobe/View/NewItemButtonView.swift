//
//  NewItemButtonView.swift
//  Wardrobe
//
//  Created by Michael Kilgore on 8/20/21.
//

import SwiftUI

struct NewItemButtonView: View {
    // MARK: - PROPERTY
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Group {
            HStack {
                Spacer()
                Image(systemName: "plus")
                    .font(.largeTitle)
                Spacer()
            }
            .padding(.vertical, 10)
            .background(colorScheme == .dark ? Color.black : Color.white)
            //.background(Color.white)
        }
        .cornerRadius(12)
    }
}

struct NewItemButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemButtonView()
    }
}
