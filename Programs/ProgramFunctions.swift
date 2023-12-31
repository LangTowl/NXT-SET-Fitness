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

func update_ledger(day: ProgramDay, exercise: Exercise) {
    exercise.ledger.append(LedgerItem(day: day.id, exercise: exercise.id, index: day.exercises.count))
}

func delete_from_ledger(day: ProgramDay, exercises: Exercise) {
    for i in 0...(exercises.ledger.count - 1) {
        if exercises.ledger[i].id == day.id {
            exercises.ledger.remove(at: i)
        }
    }
}

func find_in_ledger(day: ProgramDay, exercise: Exercise) -> Int {
    for i in 0...(exercise.ledger.count - 1) {
        if exercise.ledger[i].day == day.id {
            return exercise.ledger[i].index
        }
    }
    
    return 0;
}

struct ExerciseOrderBuffer: Hashable {
    let id: UUID
    let name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}

func build_buffer(day: [Exercise]) -> [ExerciseOrderBuffer] {
    var buffer: [ExerciseOrderBuffer] = []
    for i in 0...(day.count - 1) {
        buffer.append(ExerciseOrderBuffer(id: day[i].id, name: day[i].name))
    }
    
    return buffer
}
