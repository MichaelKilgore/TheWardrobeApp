//
//  NavigationBarView.swift
//  Wardrobe
//
//  Created by Michael Kilgore on 8/20/21.
//

import SwiftUI

struct NavigationBarView: View {
    // MARK: - PROPERTY
    
    @State var showingFilterView: Bool = false
    @State var showingSettingsView: Bool = false
    
    @Binding var clothingType: [Bool]
    @Binding var colors: [Bool]
    @Binding var attireTypes: [Bool]
    @Binding var temps: [Bool]
    
    @EnvironmentObject var BackgroundColors: BackgroundColors
    
    @Environment(\.colorScheme) var colorScheme
    
    // MARK: - BODY
    var body: some View {
        HStack {
            Image(systemName: "gearshape")
                .font(.largeTitle)
                .padding()
                .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                .onTapGesture {
                    showingSettingsView = true
                }
                .sheet(isPresented: $showingSettingsView) {
                    SettingsView()
                        .environmentObject(BackgroundColors)
                }
            
            Spacer()
            
            Text("Wardrobe")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
            
            Spacer()
            
            Image(systemName: "camera.filters")
                .font(.largeTitle)
                .padding()
                .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                .onTapGesture {
                    showingFilterView = true
                }
                .sheet(isPresented: $showingFilterView) {
                    FiltersView(clothingType: $clothingType, colors: $colors, attireTypes: $attireTypes, temps: $temps)
                }
            
        } //: HSTACK
        .background(
            colorScheme == .dark ? Color.black : Color.white
        )
    }
}

// MARK: - PREVIEW
struct NavigationBarView_Previews: PreviewProvider {
    @State static var clothingTypeFilter: [Bool] = [true, true, true, true, true, true, true, true, true, true, true, true, true, true]
    @State static var colorsFilter: [Bool] = [true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true]
    @State static var attireTypesFilter: [Bool] = [true, true, true]
    @State static var tempsFilter: [Bool] = [true, true, true, true, true, true, true, true]
    
    
    static var previews: some View {
        NavigationBarView(clothingType: $clothingTypeFilter, colors: $colorsFilter, attireTypes: $attireTypesFilter, temps: $tempsFilter)
            .previewLayout(.sizeThatFits)
            .padding()
            .environmentObject(BackgroundColors())
    }
}
