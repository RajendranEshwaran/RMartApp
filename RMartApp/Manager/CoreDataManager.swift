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
    //MARK:- Get data from coredata
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
    
    // Get cart product total count
    func getUserCartData(phonenumber:String) -> [CartEntity] {
        var userProfiles = [CartEntity]()
        let uProfileRequest: NSFetchRequest<CartEntity> = CartEntity.fetchRequest()
        uProfileRequest.predicate = NSPredicate(format: "phoneNumber = %@", phonenumber)
        
        do {
            userProfiles = try self.managedContext.fetch(uProfileRequest)
        } catch {
            print(error)
        }
        return userProfiles
    }
  
    // Get cart product total count
    func getUserCartDataWithoutPhone() -> [CartEntity] {
        var userProfiles = [CartEntity]()
        let uProfileRequest: NSFetchRequest<CartEntity> = CartEntity.fetchRequest()
       // uProfileRequest.predicate = NSPredicate(format: "phoneNumber = %@", phonenumber)
        
        do {
            userProfiles = try self.managedContext.fetch(uProfileRequest)
        } catch {
            print(error)
        }
        return userProfiles
    }
    
    // Get cart product total count
    func getCartSingeProductData(phonenumber:String) -> [CartProductEntity] {
        var userProfiles = [CartProductEntity]()
        let uProfileRequest: NSFetchRequest<CartProductEntity> = CartProductEntity.fetchRequest()
        uProfileRequest.predicate = NSPredicate(format: "phoneNumber = %@", phonenumber)
        
        do {
            userProfiles = try self.managedContext.fetch(uProfileRequest)
        } catch {
            print(error)
        }
        return userProfiles
    }
    
    // Get cart product total count
    func getCartSingeProductDataAll() -> [CartProductEntity] {
        var userProfiles = [CartProductEntity]()
        let uProfileRequest: NSFetchRequest<CartProductEntity> = CartProductEntity.fetchRequest()
        //uProfileRequest.predicate = NSPredicate(format: "phoneNumber = %@", phonenumber)
        
        do {
            userProfiles = try self.managedContext.fetch(uProfileRequest)
        } catch {
            print(error)
        }
        return userProfiles
    }
    
//MARK:- Save data to coredata
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
    
    // Save user cart data
    func saveUserCartData(id: String, productCount: Int,phoneNumber:String) {
        let productData = CartEntity(context: self.managedContext)
        productData.id = id
        productData.itemCount = Int64(productCount)
        productData.phoneNumber = phoneNumber
        do {
            try self.managedContext.save()
            print("cart data saved \(Int64(productCount))")
        } catch {
            print(error)
        }
    }
 
    // Save user card prodcutdetails data
    func saveSingleProductCartData(id: UUID, productName: String?,  productCPrice: String?, productAPrice: String?,productSPrice: String?, productCount: Int64,phoneNumber:String) {
        let userdata = CartProductEntity(context: self.managedContext)
        userdata.id = id
        userdata.productName = productName
        userdata.productSPrice = productSPrice
        userdata.productCPrice = productCPrice
        userdata.productAPrice = productAPrice
        userdata.productCount = productCount
        userdata.phoneNumber = phoneNumber
        do {
            try self.managedContext.save()
            print("single product saved")
        } catch {
            print(error)
        }
    }
    
//MARK:- Update dato to coredata
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
    
    func updateUserCartCount(id: String,itemCount:Int64, phoneNumber:String) {
        let fetchRequest: NSFetchRequest<CartEntity> = CartEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate.init(format: "id=%@", id)
        do {
            let proData = try self.managedContext.fetch(fetchRequest).first
            proData?.id = id
            proData?.itemCount = itemCount
            proData?.phoneNumber = phoneNumber
          
            try self.managedContext.save()
        } catch {
            print(error)
        }
    }
    
    func updateSingleProductCartData(id: UUID, productName: String?,  productCPrice: String?, productAPrice: String?,productSPrice: String?, productCount: Int64,phoneNumber:String) {
        let fetchRequest: NSFetchRequest<CartProductEntity> = CartProductEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate.init(format: "productName=%@", productName!)
        do {
            let proData = try self.managedContext.fetch(fetchRequest).first
            proData?.id = id
            proData?.productName = productName
            proData?.productAPrice = productAPrice
            proData?.productCPrice = productCPrice
            proData?.productSPrice = productSPrice
            proData?.phoneNumber = phoneNumber
            proData?.productCount = productCount
          
            try self.managedContext.save()
        } catch {
            print(error)
        }
    }
    
   /* // remove birthday//updateUserCartCount
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
