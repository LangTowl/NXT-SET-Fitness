//
//  Exercise.swift
//  NXT SET Fitness
//
//  Created by Lang Towl on 7/24/23.
//

import Foundation
import SwiftData

@Model
class Exercise {
    // Ubiquitous exercise parameters
    let id: UUID
    var name: String
    var type: String
    
    // Cardio exercise paramters
    var cardio_type: String?
    var cardio_metric: String?
    var cardio_distance: [Double]?
    var cardio_duration: [Double]?
    
    // Strength exercise paramters
    var strength_primary: String?
    var strength_secondary: String?
    var strength_starting_weight: [Double]?
    var strength_working_weight: [Double]?
    var strength_max_weight: [Double]?
    
    // Debug initializer
    init(name: String, type: String) {
        self.id = UUID()
        self.name = name
        self.type = type
    }
    
    // Distance cardio exercise initializer
    init(name: String, type: String, cardio_type: String, cardio_metric: String, cardio_distance: Double) {
        self.id = UUID()
        self.name = name
        self.type = type
        self.cardio_type = cardio_type
        self.cardio_metric = cardio_metric
        self.cardio_distance?.append(cardio_distance)
    }
    
    // Duration cardio exercise initializer
    init(name: String, type: String, cardio_type: String, cardio_metric: String, cardio_duration: Double) {
        self.id = UUID()
        self.name = name
        self.type = type
        self.cardio_type = cardio_type
        self.cardio_metric = cardio_metric
        self.cardio_duration?.append(cardio_duration)
    }
    
    // Strength exercise initializer
    init(name: String, type: String, strength_primary: String, strength_secondary: String, strength_starting_weight: Double, strength_working_weight: Double, strength_max_weight: Double) {
        self.id = UUID()
        self.name = name
        self.type = type
        self.strength_primary = strength_primary
        self.strength_secondary = strength_secondary
        self.strength_starting_weight?.append(strength_starting_weight)
        self.strength_working_weight?.append(strength_working_weight)
        self.strength_max_weight?.append(strength_max_weight)
    }
}
