//
//  ExerciseFunctions.swift
//  NXT SET
//
//  Created by Lang Towl on 9/27/23.
//

import Foundation

func find_exercise(exercises: [Exercise], id: UUID) -> Int {
    for i in 0...(exercises.count - 1) {
        if exercises[i].id == id {
            return i;
        }
    }
    
    return 0;
}
