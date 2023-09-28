//
//  Account.swift
//  NXT SET
//
//  Created by Lang Towl on 9/26/23.
//

import Foundation
import SwiftData

@Model
class User {
    // User data
    let id = UUID()
    var name: String
    var email: String
    var password: String
    var signed_in: Bool = false
    
    // User programs
    var programs: [Program] = []
    
    // User exercises
    var exercises: [Exercise] = []
    
    init(name: String, email: String, password: String) {
        self.name = name
        self.email = email
        self.password = password
    }
}
