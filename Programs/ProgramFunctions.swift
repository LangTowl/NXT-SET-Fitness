//
//  ProgramFunctions.swift
//  NXT SET
//
//  Created by Lang Towl on 9/27/23.
//

import Foundation

func verify_active_program(program: Program, program_list: [Program]) {
    for i in 0...(program_list.count - 1) {
        if program_list[i].id != program.id {
            program_list[i].activate_program = false
        }
    }
}
