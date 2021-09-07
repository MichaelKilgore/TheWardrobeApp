//
//  Outfit+CoreDataProperties.swift
//  Wardrobe
//
//  Created by Michael Kilgore on 9/6/21.
//
//

import Foundation
import SwiftUI
import CoreData


extension Outfit {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Outfit> {
        return NSFetchRequest<Outfit>(entityName: "Outfit")
    }

    @NSManaged public var name: String?
    @NSManaged public var item: NSSet?
    
    public var itemArray: [Item] {
        let set = item as? Set<Item> ?? []
        
        return set.sorted {
            $0.name! < $1.name!
        }
    }
    
    public var imageArray: [Image] {
        let set = item as? Set<Item> ?? []
        
        var images: [Image] = []
        
        for i in set {
            print("\(i.name)")
            images.append(Image(uiImage: UIImage(data: i.image!)!))
        }
        
        return images
    }

}

// MARK: Generated accessors for item
extension Outfit {

    @objc(addItemObject:)
    @NSManaged public func addToItem(_ value: Item)

    @objc(removeItemObject:)
    @NSManaged public func removeFromItem(_ value: Item)

    @objc(addItem:)
    @NSManaged public func addToItem(_ values: NSSet)

    @objc(removeItem:)
    @NSManaged public func removeFromItem(_ values: NSSet)

}

extension Outfit : Identifiable {

}
