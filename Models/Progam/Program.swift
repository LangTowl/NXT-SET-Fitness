//
//  Program.swift
//  NXT SET
//
//  Created by Lang Towl on 9/27/23.
//

import Foundation
import SwiftData

@Model
class Program {
    // Basic program members
    let id = UUID()
    var name: String
    var type: ProgramType
    var activate_program: Bool = false
    var active_day: Int = 0
    var program_days: [ProgramDay] = []
    
    // Basic program initializer
    init(name: String, type: ProgramType) {
        self.name = name
        self.type = type
        
        switch type {
        case .daily:
            program_days.append(ProgramDay(name: "Day 1", index: 0))
        case .weekly:
            program_days = [
                ProgramDay(name: "Day 1", index: 0),
                ProgramDay(name: "Day 2", index: 1),
                ProgramDay(name: "Day 3", index: 2),
                ProgramDay(name: "Day 4", index: 3),
                ProgramDay(name: "Day 5", index: 4),
                ProgramDay(name: "Day 6", index: 5),
                ProgramDay(name: "Day 7", index: 6)
            ]
        }
    }
}
