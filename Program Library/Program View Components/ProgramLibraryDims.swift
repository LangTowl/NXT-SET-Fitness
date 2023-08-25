//
//  ProgramLibraryDims.swift
//  NXT SET Beta 5
//
//  Created by Lang Towl on 8/8/23.
//

import Foundation
import SwiftUI
import SwiftData

let program_card_height: Double = (UIScreen.main.bounds.height * 0.7)
let program_card_corner_radius: Double = 15

let program_day_button_radius: Double = 45

let weeklky_program_ids: [String] = ["M", "T", "W", "T", "F", "S", "S"]
let weekly_program_names: [String] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

func update_buffer(array: [AddedExercise]) -> [String] {
    var buffer: [String] = []
    for i in 0...(array.count - 1) {
        buffer.append(array[i].name)
    }
    return buffer
}

func conform_to_buffer(array: [String], exercises: [AddedExercise]) {
    
    @Environment(\.modelContext) var model_context
    
    for i in 0...(array.count - 1) {
        for j in 0...(exercises.count - 1) {
            if array[i] == exercises[j].name {
                exercises[j].order = i
//                try? model_context.save()
            }
        }
    }
}
