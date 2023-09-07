//
//  TodaysWorkoutDims.swift
//  NXT SET Beta 5
//
//  Created by Lang Towl on 9/7/23.
//

import Foundation
import SwiftUI

let start_button_diameter: Double = (UIScreen.main.bounds.width / 1.75)

func count_total_sets(workout: ProgramDay) -> Double {
    var sets: Double = 0
    
    for i in 0...(workout.exercises.count - 1) {
        sets += Double(workout.exercises[i].sets)
    }
    
    return sets
}

func count_total_reps(workout: ProgramDay) -> Double {
    var reps: Double = 0
    
    for i in 0...(workout.exercises.count - 1) {
        reps += Double(workout.exercises[i].reps)
    }
    
    return reps
}

func count_total_exercises(workout: ProgramDay) -> Double {
    return Double(workout.exercises.count)
}

func aproximate_duration(workout: ProgramDay) -> Double {
    var sec: Double = 0
    
    for i in 0...(workout.exercises.count - 1) {
        sec += 90
        sec += Double(workout.exercises[i].sets * (workout.exercises[i].reps * 10))
    }
    
    return sec / 60
}
