//
//  ExerciseTypes.swift
//  NXT SET Fitness
//
//  Created by Lang Towl on 7/23/23.
//

import Foundation

enum ExerciseType: String, Codable {
    case cardio
    case strength
    case empty
}

let exercise_types: [ExerciseType] = [.cardio, .strength]
