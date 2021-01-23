//
//  CartEntity+CoreDataProperties.swift
//  RMartApp
//
//  Created by gomathi saminathan on 1/23/21.
//
//

import Foundation
import CoreData


extension CartEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CartEntity> {
        return NSFetchRequest<CartEntity>(entityName: "CartEntity")
    }

    @NSManaged public var itemCount: Int64
    @NSManaged public var id: UUID

}

extension CartEntity : Identifiable {

}
