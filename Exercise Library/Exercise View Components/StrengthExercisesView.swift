//
//  StrengthExercisesView.swift
//  NXT SET Beta 5
//
//  Created by Lang Towl on 8/7/23.
//

import SwiftUI
import SwiftData

struct StrengthExercisesView: View {
    
    @Environment(\.modelContext) private var model_context
    @Query(filter: #Predicate<Exercise> {$0.type == ExerciseType.strength.rawValue }) var strength_exercises: [Exercise]
    
    var chest_exercises: [Exercise] {
        strength_exercises.filter { $0.primary_muscle == PrimaryMuscle.chest.rawValue}
    }
    
    var back_exercises: [Exercise] {
        strength_exercises.filter { $0.primary_muscle == PrimaryMuscle.back.rawValue}
    }
    
    var shoulder_exercises: [Exercise] {
        strength_exercises.filter { $0.primary_muscle == PrimaryMuscle.shoulder.rawValue}
    }
    
    var tricep_exercises: [Exercise] {
        strength_exercises.filter { $0.primary_muscle == PrimaryMuscle.tricep.rawValue}
    }
    
    var bicep_exercises: [Exercise] {
        strength_exercises.filter { $0.primary_muscle == PrimaryMuscle.bicep.rawValue}
    }
    
    var forearm_exercises: [Exercise] {
        strength_exercises.filter { $0.primary_muscle == PrimaryMuscle.forearm.rawValue}
    }
    
    var core_exercises: [Exercise] {
        strength_exercises.filter { $0.primary_muscle == PrimaryMuscle.core.rawValue}
    }
    
    var quad_exercises: [Exercise] {
        strength_exercises.filter { $0.primary_muscle == PrimaryMuscle.quad.rawValue}
    }
    
    var hamstring_exercises: [Exercise] {
        strength_exercises.filter { $0.primary_muscle == PrimaryMuscle.hamstring.rawValue}
    }
    
    var glute_exercises: [Exercise] {
        strength_exercises.filter { $0.primary_muscle == PrimaryMuscle.glute.rawValue}
    }
    
    var calve_exercises: [Exercise] {
        strength_exercises.filter { $0.primary_muscle == PrimaryMuscle.calve.rawValue}
    }
    
    var other_strength_exercises: [Exercise] {
        strength_exercises.filter { $0.primary_muscle == PrimaryMuscle.other.rawValue}
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
