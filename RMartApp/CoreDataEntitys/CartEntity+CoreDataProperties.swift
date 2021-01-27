//
//  CartEntity+CoreDataProperties.swift
//  RMartApp
//
//  Created by RMart on 1/25/21.
//
//

import Foundation
import CoreData


extension CartEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CartEntity> {
        return NSFetchRequest<CartEntity>(entityName: "CartEntity")
    }

    @NSManaged public var id: String?
    @NSManaged public var phoneNumber: String?
    @NSManaged public var itemCount: Int64

}

extension CartEntity : Identifiable {

}
