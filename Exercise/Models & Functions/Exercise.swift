//
//  Exercise.swift
//  NXT SET Fitness
//
//  Created by Lang Towl on 7/22/23.
//

import Foundation
import SwiftData

@Model
class Exercise {
    var name: String
    var type: ExerciseType
    
    // Cardio exercise parameters
    var cardio_type: CardioType?
    var cardio_metric: CardioMetric?
    var cardio_duration: Double?
    var cardio_distance: Double?
    
    // Strength exercise parameters
    var strength_primary: PrimaryMuscle?
    var strength_secondary: String?
    var strength_starting_weight: Double?
    var strength_working_weight: Double?
    var strength_max_weight: Double?
    
    // Duration cardio exercise initializer
    init(name: String, type: ExerciseType, cardio_type: CardioType, cardio_metric: CardioMetric, cardio_duration: Double) {
        self.name = name
        self.type = type
        self.cardio_type = cardio_type
        self.cardio_metric = cardio_metric
        self.cardio_duration = cardio_duration
    }
    
    // Distance cardio exercise initializer
    init(name: String, type: ExerciseType, cardio_type: CardioType, cardio_metric: CardioMetric, cardio_distance: Double) {
        self.name = name
        self.type = type
        self.cardio_type = cardio_type
        self.cardio_metric = cardio_metric
        self.cardio_distance = cardio_distance
    }
    
    // Strength exercise initializer
    init(name: String, type: ExerciseType, strength_primary: PrimaryMuscle, strength_secondary: String, strength_starting_weight: Double, strength_working_weight: Double, strength_max_weight: Double) {
        self.name = name
        self.type = type
        self.strength_primary = strength_primary
        self.strength_secondary = strength_secondary
        self.strength_starting_weight = strength_starting_weight
        self.strength_working_weight = strength_working_weight
        self.strength_max_weight = strength_max_weight
    }
}
