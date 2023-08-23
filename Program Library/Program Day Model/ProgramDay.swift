//
//  ProgramDay.swift
//  NXT SET Beta 5
//
//  Created by Lang Towl on 8/8/23.
//

import Foundation
import SwiftData

@Model
class ProgramDay {
    let id = UUID()
    var name: String
    var order: Int
    var is_off_day: Bool = false
    @Relationship(.cascade) var exercises = [AddedExercise]()
    
    init(name: String, order: Int) {
        self.name = name
        self.order = order
    }
}
