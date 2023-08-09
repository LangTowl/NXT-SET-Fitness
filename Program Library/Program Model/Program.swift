//
//  Program.swift
//  NXT SET Beta 5
//
//  Created by Lang Towl on 8/8/23.
//

import Foundation
import SwiftData

@Model
class Program {
    let id = UUID()
    var name: String
    var type: ProgramType.RawValue
    @Relationship(.cascade) var program_days = [ProgramDay]()

    
    init(name: String, type: ProgramType.RawValue) {
        self.name = name
        self.type = type
        
        if type == "daily" {
            program_days = [ProgramDay(name: "Day 1", order: 0)]
        } else if type == "weekly" {
            program_days = [
                ProgramDay(name: "Monday", order: 0),
                ProgramDay(name: "Tuesday", order: 1),
                ProgramDay(name: "Wednesday", order: 2),
                ProgramDay(name: "Thursday", order: 3),
                ProgramDay(name: "Friday", order: 4),
                ProgramDay(name: "Saturday", order: 5),
                ProgramDay(name: "Sunday", order: 6)
            ]
        }
    }
}
