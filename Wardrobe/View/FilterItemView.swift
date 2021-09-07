//
//  FilterItemView.swift
//  Wardrobe
//
//  Created by Michael Kilgore on 8/24/21.
//

import SwiftUI

struct FilterItemView: View {
    
    let name: String
    @Binding var filter: Bool
    
    var body: some View {
        HStack {
            Toggle(isOn: $filter) {
                Text(name)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
            }
            .toggleStyle(CheckboxStyle())
            
            Spacer()
        }
    }
}

struct FilterItemView_Previews: PreviewProvider {
    @State static var allFilters = [false, false, false]
    
    
    static var previews: some View {
        FilterItemView(name: "Black", filter: .constant(true))
    }
}
