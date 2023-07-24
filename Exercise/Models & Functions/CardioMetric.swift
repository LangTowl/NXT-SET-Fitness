//
//  CardioMetric.swift
//  NXT SET Fitness
//
//  Created by Lang Towl on 7/23/23.
//

import Foundation

enum CardioMetric: String, Codable {
    case distance
    case duration
    case empty
}

let cardio_metrics: [CardioMetric] = [.distance, .duration]
