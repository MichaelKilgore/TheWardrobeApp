//
//  Item+CoreDataProperties.swift
//  Wardrobe
//
//  Created by Michael Kilgore on 9/6/21.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var attireTypes: String?
    @NSManaged public var colors: String?
    @NSManaged public var id: UUID?
    @NSManaged public var image: Data?
    @NSManaged public var name: String?
    @NSManaged public var temps: String?
    @NSManaged public var timestamp: Date?
    @NSManaged public var type: String?
    @NSManaged public var origin: Outfit?

}

extension Item : Identifiable {

}
