//
//  ProgramDay.swift
//  NXT SET Fitness
//
//  Created by Lang Towl on 8/2/23.
//

import Foundation
import SwiftData

@Model
class ProgramDay {
    let id: UUID
    var name: String
    let position: Int
    var exercises: [Exercise]
    
    init(name: String, position: Int) {
        self.id = UUID()
        self.name = name
        self.position = position
        self.exercises = [Exercise]()
    }
}
