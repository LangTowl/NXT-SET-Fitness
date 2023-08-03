//
//  ProgramLibraryDims.swift
//  NXT SET Fitness
//
//  Created by Lang Towl on 8/1/23.
//

import Foundation
import SwiftUI
import SwiftData

let program_card_height: Double = (UIScreen.main.bounds.height * 0.7)
let program_card_corner_radius: Double = 15

let program_day_button_radius: Double = 45

let weeklky_program_ids: [String] = ["M", "T", "W", "T", "F", "S", "S"]

func delete_ordered_program_day(program: Program, index: Int, context: ModelContext) {
    for i in 0...(program.program_days.count - 1) {
        if index == program.program_days[i].position {
            program.program_days.remove(at: i)
            try? context.save()
        }
    }
}
