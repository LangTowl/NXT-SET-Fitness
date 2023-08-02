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
    @Relationship(.cascade) var program_days: [ProgramDay]
    
    // Complete program initializer
    init(name: String, type: String) {
        self.id = UUID()
        self.name = name
        self.type = type
        
        switch type {
        case "daily":
            self.program_days = [ProgramDay(name: "", position: 0)]
        case "weekly":
            self.program_days = [
                ProgramDay(name: "", position: 0),
                ProgramDay(name: "" ,position: 1),
                ProgramDay(name: "", position: 2),
                ProgramDay(name: "", position: 3),
                ProgramDay(name: "", position: 4),
                ProgramDay(name: "", position: 5),
                ProgramDay(name: "", position: 6)
            ]
        default:
            break
        }
    }
}
