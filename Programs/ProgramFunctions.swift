//
//  ProgramFunctions.swift
//  NXT SET
//
//  Created by Lang Towl on 9/27/23.
//

import Foundation

let weekday_names: [String] = ["sun", "mon", "tue", "wed", "thu", "fri", "sat"]

func verify_active_program(program: Program, program_list: [Program]) {
    for i in 0...(program_list.count - 1) {
        if program_list[i].id != program.id {
            program_list[i].activate_program = false
        }
    }
}

func find_program(programs: [Program], id: UUID) -> Int {
    for i in 0...(programs.count - 1) {
        if programs[i].id == id {
            return i
        }
    }
    
    return 0
}

func is_exercise_in_program_day(day: ProgramDay, exercise: Exercise) -> Bool {
    if day.exercises.isEmpty {
        return false
    } else {
        for i in 0...(day.exercises.count - 1) {
            if day.exercises[i].id == exercise.id {
                return true
            }
        }
    }
    
    return false
}

func find_index_of_exercise(day: ProgramDay, exercise: Exercise) -> Int {
    if day.exercises.isEmpty {
        return -1
    } else {
        for i in 0...(day.exercises.count - 1) {
            if day.exercises[i].id == exercise.id {
                return i
            }
        }
    }
    
    return -1;
}

