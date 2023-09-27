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
    // Basic exercise members
    let id = UUID()
    var name: String
    var type: ExerciseType
    
    // Strength exercise members
    var primary_muscle: PrimaryMuscle?
    var secondary_muscle: String?
    var starting_weight: [Double]? = []
    var working_weight: [Double]? = []
    var max_weight: [Double]? = []
    
    // Cardio exercise members
    var cardio_type: CardioType?
    var cardio_exercise: CardioExercise?
    var cardio_metric: [Double]?
    
    // Basic exercise constructor
    init(name: String, type: ExerciseType) {
        self.name = name
        self.type = type
    }
    
    // Strength exercise constructor
    init(name: String, type: ExerciseType, primary_muscle: PrimaryMuscle, secondary_muscle: String, starting_weight: Double, working_weight: Double, max_weight: Double) {
        self.name = name
        self.type = type
        self.primary_muscle = primary_muscle
        self.secondary_muscle = secondary_muscle
        self.starting_weight?.append(starting_weight)
        self.working_weight?.append(working_weight)
        self.max_weight?.append(max_weight)
    }
    
    // Cardio exercise constructor
    init(name: String, type: ExerciseType, cardio_type: CardioType, cardio_exercise: CardioExercise, cardio_metric: Double) {
        self.name = name
        self.type = type
        self.primary_muscle = primary_muscle
        self.secondary_muscle = secondary_muscle
        self.cardio_type = cardio_type
        self.cardio_exercise = cardio_exercise
        self.cardio_metric?.append(cardio_metric)
    }
}
