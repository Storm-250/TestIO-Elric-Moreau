//
//  ContentViewModel.swift
//  TestSubDeVinci
//
//  Created by COURS on 19/04/2024.
//

import Foundation

class ContentViewModel: ObservableObject {
    
    @Published var pseudo: String = ""
    @Published var familyName: String = ""
    @Published var firstName: String = ""
    @Published var password: String = ""
    @Published var isAdmin: Bool = false
    
    var storageModel = DataController.shared
    
    func saveUser(pseudo: String,familyName: String,firstName: String,isAdmin: Bool, password:String) {
        storageModel.saveUser(pseudo: pseudo, familyName: familyName, firstName: firstName, isAdmin: isAdmin, password: password)
    }
    func deleteUser(user: User) {
        storageModel.remove(user: user)
    }
    
    func getAllUsers() -> [User] {
        storageModel.getAllUsers()
    }
    
}
