//
//  LoginEntity+CoreDataProperties.swift
//  RMartApp
//
//  Created by gomathi saminathan on 1/15/21.
//
//

import Foundation
import CoreData


extension LoginEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LoginEntity> {
        return NSFetchRequest<LoginEntity>(entityName: "LoginEntity")
    }

    @NSManaged public var phoneNumber: String?

}

extension LoginEntity : Identifiable {

}
