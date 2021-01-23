//
//  CartProductEntity+CoreDataProperties.swift
//  RMartApp
//
//  Created by gomathi saminathan on 1/23/21.
//
//

import Foundation
import CoreData


extension CartProductEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CartProductEntity> {
        return NSFetchRequest<CartProductEntity>(entityName: "CartProductEntity")
    }
    @NSManaged public var id: UUID
    @NSManaged public var productName: String?
    @NSManaged public var productAPrice: String?
    @NSManaged public var productSPrice: String?
    @NSManaged public var productCPrice: String?
    @NSManaged public var productCount: Int64

}

extension CartProductEntity : Identifiable {

}
