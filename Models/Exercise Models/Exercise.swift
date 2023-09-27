//
//  Exercise.swift
//  NXT SET
//
//  Created by Lang Towl on 9/26/23.
//

import Foundation
import SwiftData

@Model
class Exercise {
    let id = UUID()
    var name: String
    var type: ExerciseType
    
    init(name: String, type: ExerciseType) {
        self.name = name
        self.type = type
    }
}
