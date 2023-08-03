//
//  ExerciseLibraryDims.swift
//  NXT SET Fitness
//
//  Created by Lang Towl on 7/25/23.
//

import Foundation
import SwiftUI

let exercise_card_width: Double = (UIScreen.main.bounds.width / 2.5)
let exercise_card_height: Double = (UIScreen.main.bounds.width / 2.5)
let exercise_card_corner_radius: Double = 15
let exercise_card_spacing: Double = 15

let exercise_inspector_graph_width: Double = UIScreen.main.bounds.width
let exercise_inspector_graph_height: Double = (UIScreen.main.bounds.width / 1.75)

let exercise_inspector_bubble_width: Double = (UIScreen.main.bounds.width / 2.75)

let exercise_inspector_bubble_height: Double = (UIScreen.main.bounds.width / 4)

func compute_graph_height(value: Double) -> Double {
    let temp: Double = value * 0.1 * 5
    return temp
}
