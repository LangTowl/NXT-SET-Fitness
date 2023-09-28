//
//  ProgramDay.swift
//  NXT SET
//
//  Created by Lang Towl on 9/27/23.
//

import Foundation
import SwiftData

@Model
class ProgramDay {
    // Basic program members
    let id = UUID()
    var name: String
    var active_day: Bool = false
    var index: Int
    var exercises: [Exercise] = []
    
    // Basic programday initalizer
    init(name: String, index: Int) {
        self.name = name
        self.index = index
    }
}
