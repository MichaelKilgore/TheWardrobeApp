//
//  ContentView.swift
//  Wardrobe
//
//  Created by Michael Kilgore on 8/20/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    // MARK: - PROPERTY
    
    @AppStorage("happyBirthday") var happyBirthday: Bool = false
    @EnvironmentObject var BackgroundColors: BackgroundColors

    // MARK: - FUNCTION
    
    // MARK: - BODY
    var body: some View {
        if happyBirthday {
            IntroView()
                .environmentObject(BackgroundColors)
        } else {
            AppView()
                .environmentObject(BackgroundColors)
        }
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .environmentObject(BackgroundColors())
    }
}
