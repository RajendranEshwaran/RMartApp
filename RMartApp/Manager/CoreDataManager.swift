//
//  CoreDataManager.swift
//  RMartApp
//
//  Created by RMart on 1/16/21.
//

import Foundation
import UIKit
import CoreData

class DataManager{
    
    static let shared = DataManager(moc: NSManagedObjectContext.current)
    var managedContext: NSManagedObjectContext
    
    private init(moc: NSManagedObjectContext) {
        self.managedContext = moc
    }
    
    // Get user profile records 
    func getUserProfileData() -> [UserDataEntity] {
        var userProfiles = [UserDataEntity]()
        let uProfileRequest: NSFetchRequest<UserDataEntity> = UserDataEntity.fetchRequest()
        
        do {
            userProfiles = try self.managedContext.fetch(uProfileRequest)
        } catch {
            print(error)
        }
        return userProfiles
    }
    
    // Save user profile data
    func saveUserProfileData(id: UUID, firstName: String?,  lastName: String?, gender: String?,dob: Date?, phoneNumber: String, emailId: String?) {
        let userdata = UserDataEntity(context: self.managedContext)
        userdata.id = id
        userdata.firstName = firstName
        userdata.lastName = lastName
        userdata.gender = gender
        userdata.dob = dob
        userdata.phoneNumber = phoneNumber
        userdata.emailId = emailId
        do {
            try self.managedContext.save()
            print("profile saved")
        } catch {
            print(error)
        }
    }
    
   /* // remove birthday
    func removeBirthday(id: UUID) {
        let fetchRequest: NSFetchRequest<Birthday> = Birthday.fetchRequest()
        fetchRequest.predicate = NSPredicate.init(format: "id=%@", id.uuidString)
        do {
            let bdays = try self.managedContext.fetch(fetchRequest)
            for bday in bdays {
                self.managedContext.delete(bday)
            }
            try self.managedContext.save()
        } catch {
          print(error)
        }
    }
    
    // update birthday
    func updateBirthday(id: UUID, name: String, date: Date) {
        let fetchRequest: NSFetchRequest<Birthday> = Birthday.fetchRequest()
        fetchRequest.predicate = NSPredicate.init(format: "id=%@", id.uuidString)
        do {
            let bday = try self.managedContext.fetch(fetchRequest).first
            bday?.date = date
            bday?.name = name
            try self.managedContext.save()
        } catch {
            print(error)
        }
    }*/
}
extension NSManagedObjectContext {
    static var current: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}
