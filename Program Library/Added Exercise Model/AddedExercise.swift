//
//  AddedExercise.swift
//  NXT SET Beta 5
//
//  Created by Lang Towl on 8/14/23.
//

import Foundation
import SwiftData

@Model
class AddedExercise {
    let id = UUID()
    var sets: Int = 0
    var reps: Int = 0
    
    var name: String
    var type: ExerciseType.RawValue?
    
    var primary_muscle: PrimaryMuscle.RawValue?
    var secondary_muscle: String?
    var starting_weight: Double?
    var working_weight: Double?
    var max_weight: Double?
    
    var cardio_type: CardioType.RawValue?
    var cardio_metric: CardioMetric.RawValue?
    var distance: Double?
    var duration: Double?
    
    init(name: String) {
        self.name = name
    }
    
    init(name: String, type: ExerciseType.RawValue) {
        self.name = name
        self.type = type
    }
    
    init(name: String, type: ExerciseType.RawValue, primary_muscle: PrimaryMuscle.RawValue, secondary_muscle: String, starting_weight: Double, working_weight: Double, max_weight: Double) {
        self.name = name
        self.type = type
        self.primary_muscle = primary_muscle
        self.secondary_muscle = secondary_muscle
        self.starting_weight = starting_weight
        self.working_weight = working_weight
        self.max_weight = max_weight
    }
    
    init(name: String, type: ExerciseType.RawValue, cardio_type: CardioType.RawValue, cardio_metric: CardioMetric.RawValue, distance: Double) {
        self.name = name
        self.type = type
        self.cardio_type = cardio_type
        self.cardio_metric = cardio_metric
        self.distance = distance
    }
    
    init(name: String, type: ExerciseType.RawValue, cardio_type: CardioType.RawValue, cardio_metric: CardioMetric.RawValue, duration: Double) {
        self.name = name
        self.type = type
        self.cardio_type = cardio_type
        self.cardio_metric = cardio_metric
        self.duration = duration
    }
}
