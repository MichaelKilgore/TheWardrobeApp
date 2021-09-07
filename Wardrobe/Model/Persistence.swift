//
//  Persistence.swift
//  Wardrobe
//
//  Created by Michael Kilgore on 8/20/21.
//

import CoreData
import SwiftUI

struct PersistenceController {
    // MARK: - 1. PRESISTENT CONTROLLER
    static let shared = PersistenceController()

    // MARK: - 2. PERSISTENT CONTAINER
    let container: NSPersistentContainer
    
    // MARK: - 3. INITIALIZATION (load the persistent store)
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Wardrobe")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
    
    // MARK: - PREVIEW
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for i in 0..<5 {
            
            
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.name = "Blue T-shirt No\(i)"
            newItem.type = "Shirt"
            newItem.id = UUID()
            
            // FILTERS
            //("black", "white", "gray", "silver", "maroon", "red", "purple", "fushsia", "green", "lime", "olive", "yellow", "navy", "blue", "teal", and "aqua"
            newItem.colors = "0100100000000000" // 16
            newItem.attireTypes = "01000000"
            newItem.temps = "001"
            
            // IMAGE
            
            let image: UIImage = UIImage(imageLiteralResourceName: "testImage")
            newItem.image = image.jpegData(compressionQuality: 1.0)
            
            let outfit = Outfit(context: viewContext)
            outfit.name = "Cool Green Outfit"
            outfit.addToItem(newItem)
            
            let secondItem = Item(context: viewContext)
            secondItem.timestamp = Date()
            secondItem.name = "Brah"
            secondItem.type = "Pants"
            secondItem.id = UUID()
            secondItem.colors = "0000000000100000"
            secondItem.attireTypes = "01000000"
            secondItem.temps = "001"
            
            secondItem.image = image.jpegData(compressionQuality: 1.0)
            
            outfit.addToItem(secondItem)
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

}
