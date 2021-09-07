//
//  FiltersView.swift
//  Wardrobe
//
//  Created by Michael Kilgore on 8/27/21.
//

import SwiftUI

struct FiltersView: View {
    
    @Binding var clothingType: [Bool]
    @Binding var colors: [Bool]
    @Binding var attireTypes: [Bool]
    @Binding var temps: [Bool]
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Filters")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                    Spacer()
                }
                
                HStack {
                    Text("Clothing Type")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding()
                    Spacer()
                }
                
                LazyVGrid(columns: gridLayout, spacing: 15, content: {
                    //FilterItemView(name: "Hat", filters: $clothingType, index: 0)
                    ForEach(0..<types.count) { index in
                        FilterItemView(name: types[index], filter: $clothingType[index])
                        
                    }
                })
                .padding()
                
                HStack {
                    Text("Color")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding()
                    Spacer()
                }
                //("black", "white", "gray", "silver", "maroon", "red", "purple", "fushsia", "green", "lime", "olive", "yellow", "navy", "blue", "teal", and "aqua")
                LazyVGrid(columns: gridLayout, spacing: 15, content: {
                    ForEach(0..<colorNames.count) { index in
                        FilterItemView(name: colorNames[index], filter: $colors[index])
                    }
                })
                .padding()
                
                HStack {
                    Text("Attire Type")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding()
                    Spacer()
                }
                
                LazyVGrid(columns: gridLayout, spacing: 15, content: {
                    FilterItemView(name: "Formal", filter: $attireTypes[0])
                    FilterItemView(name: "Casual", filter: $attireTypes[1])
                    FilterItemView(name: "Sleep Wear", filter: $attireTypes[2])
                    FilterItemView(name: "Swim Wear", filter: $attireTypes[3])
                    FilterItemView(name: "Cozy", filter: $attireTypes[4])
                    FilterItemView(name: "Night Out", filter: $attireTypes[5])
                    FilterItemView(name: "Night In", filter: $attireTypes[6])
                    FilterItemView(name: "Costume", filter: $attireTypes[7])
                })
                .padding()
                
                HStack {
                    Text("Temperature")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding()
                    Spacer()
                }
                
                LazyVGrid(columns: gridLayout, spacing: 15, content: {
                    FilterItemView(name: "Cold", filter: $temps[0])
                    FilterItemView(name: "Moderate", filter: $temps[1])
                    FilterItemView(name: "Hot", filter: $temps[2])
                })
                .padding()
                
            } //: VSTACK
        } //: SCROLLVIEW
    }
}

struct FiltersView_Previews: PreviewProvider {
    @State static var clothingType: [Bool] = [false, false, false, false, false, false, false, false, false, false, false, false, false, false]
    @State static var colors: [Bool] = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]
    @State static var attireTypes: [Bool] = [false, false, false, false, false, false, false, false]
    @State static var temps: [Bool] = [false, false, false]
    
    static var previews: some View {
        FiltersView(clothingType: $clothingType, colors: $colors, attireTypes: $attireTypes, temps: $temps)
    }
}
