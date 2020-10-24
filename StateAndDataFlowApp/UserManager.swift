//
//  UserManager.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 22.10.2020.
//

import Combine
import Foundation

class UserManager: ObservableObject {
    @Published var isRegister: Bool
    
    let storage = UserDefaults.standard
    var name = ""
    
    init() {
        if let reg = storage.value(forKey: "Registration") as? Bool{
            isRegister = reg
        } else {
            isRegister = false
        }
    }
    
    func saveUser(name: String) {
        if !name.isEmpty {
            storage.set(name, forKey: "User")
            storage.set(true, forKey: "Registration")
            isRegister = true
        }
    }
    
    func deleteUser() {
        storage.removeObject(forKey: "User")
        storage.set(false, forKey: "Registration")
        isRegister = false
    }
    
    func getUser() -> String {
        if let user = storage.value(forKey: "User") as? String {
            return user
        } else {
            return ""
        }
    }
}
