//
//  WardrobeApp.swift
//  Wardrobe
//
//  Created by Michael Kilgore on 8/20/21.
//

import SwiftUI

@main
struct WardrobeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(BackgroundColors())
        }
    }
}
