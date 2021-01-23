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
    
    // Get user profile datas with phone number
    func getUserProfileData(phonenumber:String) -> [UserDataEntity] {
        var userProfiles = [UserDataEntity]()
        let uProfileRequest: NSFetchRequest<UserDataEntity> = UserDataEntity.fetchRequest()
        uProfileRequest.predicate = NSPredicate(format: "phoneNumber = %@", phonenumber)
        
        do {
            userProfiles = try self.managedContext.fetch(uProfileRequest)
        } catch {
            print(error)
        }
        return userProfiles
    }
    
    // Get user profile all datas
    func getUserProfileAllData() -> [UserDataEntity] {
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
    func saveUserProfileData(id: UUID, firstName: String?,  lastName: String?, gender: String?,dob: Date?, phoneNumber: String, emailId: String?,pinCode: String? ) {
        let userdata = UserDataEntity(context: self.managedContext)
        userdata.id = id
        userdata.firstName = firstName
        userdata.lastName = lastName
        userdata.gender = gender
        userdata.dob = dob
        userdata.phoneNumber = phoneNumber
        userdata.emailId = emailId
        userdata.pinCode = pinCode
        do {
            try self.managedContext.save()
            print("profile saved")
        } catch {
            print(error)
        }
    }
    
    // Save user profile data
    func saveUserCartData(id: UUID, productCount: Int) {
        let productData = CartEntity(context: self.managedContext)
        productData.id = id
        productData.itemCount = Int64(productCount)
        do {
            try self.managedContext.save()
            print("profile saved")
        } catch {
            print(error)
        }
    }
    
    func updateUserProfile(id: UUID, firstName: String?,  lastName: String?, gender: String?,dob: Date?, phoneNumber: String, emailId: String?, pinCode: String?) {
        let fetchRequest: NSFetchRequest<UserDataEntity> = UserDataEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate.init(format: "phoneNumber=%@", phoneNumber)
        do {
            let userdata = try self.managedContext.fetch(fetchRequest).first
            userdata?.id = id
            userdata?.firstName = firstName
            userdata?.lastName = lastName
            userdata?.gender = gender
            userdata?.dob = dob
            userdata?.phoneNumber = phoneNumber
            userdata?.emailId = emailId
            userdata?.pinCode = pinCode
            try self.managedContext.save()
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
