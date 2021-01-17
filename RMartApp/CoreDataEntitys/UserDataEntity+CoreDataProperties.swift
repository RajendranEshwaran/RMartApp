//
//  UserDataEntity+CoreDataProperties.swift
//  RMartApp
//
//  Created by gomathi saminathan on 1/15/21.
//
//

import Foundation
import CoreData


extension UserDataEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserDataEntity> {
        return NSFetchRequest<UserDataEntity>(entityName: "UserDataEntity")
    }

    @NSManaged public var dob: Date?
    @NSManaged public var emailId: String?
    @NSManaged public var firstName: String?
    @NSManaged public var gender: String?
    @NSManaged public var lastName: String?
    @NSManaged public var phoneNumber: String?
    @NSManaged public var id: UUID?

}

extension UserDataEntity : Identifiable {

}
