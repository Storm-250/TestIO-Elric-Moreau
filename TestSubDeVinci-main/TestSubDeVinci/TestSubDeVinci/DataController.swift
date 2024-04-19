//
//  DataController.swift
//  TestSubDeVinci
//
//  Created by COURS on 19/04/2024.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    static var shared = DataController()
        
    let container = NSPersistentContainer(name: "StorageUsers")
    
    var viewContext: NSManagedObjectContext {
        return container.viewContext
    }
    
    private init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
    
    func saveUser(pseudo: String,familyName: String,firstName: String,isAdmin: Bool, password:String) {
        let registeredUser = User(context: viewContext)
        registeredUser.pseudo = String()
        registeredUser.firstName = String()
        registeredUser.familyName = String()
        registeredUser.isAdmin = Bool()
        registeredUser.password = String()
        registeredUser.id = UUID()
        
        do {
            try viewContext.save()
        } catch {
            print("Je n'ai pas réussi à sauvegarder les données: \(error)")
        }
    }
    
    func remove(user: User) {
        viewContext.delete(user)
        do {
            try viewContext.save()
        } catch {
            print("Je n'ai pas réussi à sauvegarder les données: \(error)")
        }
    }
    
    func getAllUsers() -> [User] {
        let request = NSFetchRequest<User>(entityName: "User")

            do {
                return try viewContext.fetch(request)
            } catch {
                return []
            }
    }
}

