//
//  Program.swift
//  NXT SET Fitness
//
//  Created by Lang Towl on 8/1/23.
//

import Foundation
import SwiftData

@Model
class Program {
    // Ubiquitous program paramters
    let id: UUID
    var name: String
    var type: String
    
    // Basic program initializer
    init(name: String, type: String) {
        self.id = UUID()
        self.name = name
        self.type = type
    }
}
