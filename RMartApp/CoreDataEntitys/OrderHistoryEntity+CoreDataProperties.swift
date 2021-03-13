//
//  OrderHistoryEntity+CoreDataProperties.swift
//  RMartApp
//
//  Created by gomathi saminathan on 3/11/21.
//
//

import Foundation
import CoreData


extension OrderHistoryEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<OrderHistoryEntity> {
        return NSFetchRequest<OrderHistoryEntity>(entityName: "OrderHistoryEntity")
    }

    @NSManaged public var orderPlacedDate: Date?
    @NSManaged public var orderDeliveryDate: Date?
    @NSManaged public var shipTo: String?
    @NSManaged public var orderNumber: String?
    @NSManaged public var orderDeliveryMsg: String?
    @NSManaged public var orderItemsCount: Int64

}

extension OrderHistoryEntity : Identifiable {

}
