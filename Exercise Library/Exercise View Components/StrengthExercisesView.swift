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
    @Query(filter: #Predicate<Exercise> {$0.type == "strength" }) var strength_exercises: [Exercise]
    
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
        NavigationStack {
            ScrollView {
                HStack {
                    Text("Chest")
                        .font(.title2).bold()
                    Spacer()
                }
                
                ScrollView(.horizontal) {
                    HStack(spacing: exercise_card_spacing) {
                        ForEach(chest_exercises) {
                            ExerciseCardView(exercise: $0)
                        }
                        
                        NewExerciseButtonView()
                    }
                }
                .scrollIndicators(.hidden)
                
                HStack {
                    Text("Back")
                        .font(.title2).bold()
                    Spacer()
                }
                
                ScrollView(.horizontal) {
                    HStack(spacing: exercise_card_spacing) {
                        ForEach(back_exercises) {
                            ExerciseCardView(exercise: $0)
                        }
                        
                        NewExerciseButtonView()
                    }
                }
                .scrollIndicators(.hidden)
                
                HStack {
                    Text("Shoulder")
                        .font(.title2).bold()
                    Spacer()
                }
                
                ScrollView(.horizontal) {
                    HStack(spacing: exercise_card_spacing) {
                        ForEach(shoulder_exercises) {
                            ExerciseCardView(exercise: $0)
                        }
                        
                        NewExerciseButtonView()
                    }
                }
                .scrollIndicators(.hidden)
                
                HStack {
                    Text("Tricep")
                        .font(.title2).bold()
                    Spacer()
                }
                
                ScrollView(.horizontal) {
                    HStack(spacing: exercise_card_spacing) {
                        ForEach(tricep_exercises) {
                            ExerciseCardView(exercise: $0)
                        }
                        
                        NewExerciseButtonView()
                    }
                }
                .scrollIndicators(.hidden)
                
                HStack {
                    Text("Bicep")
                        .font(.title2).bold()
                    Spacer()
                }
                
                ScrollView(.horizontal) {
                    HStack(spacing: exercise_card_spacing) {
                        ForEach(bicep_exercises) {
                            ExerciseCardView(exercise: $0)
                        }
                        
                        NewExerciseButtonView()
                    }
                }
                .scrollIndicators(.hidden)
                
                HStack {
                    Text("Forearm")
                        .font(.title2).bold()
                    Spacer()
                }
                
                ScrollView(.horizontal) {
                    HStack(spacing: exercise_card_spacing) {
                        ForEach(forearm_exercises) {
                            ExerciseCardView(exercise: $0)
                        }
                        
                        NewExerciseButtonView()
                    }
                }
                .scrollIndicators(.hidden)
                
                HStack {
                    Text("Core")
                        .font(.title2).bold()
                    Spacer()
                }
                
                ScrollView(.horizontal) {
                    HStack(spacing: exercise_card_spacing) {
                        ForEach(core_exercises) {
                            ExerciseCardView(exercise: $0)
                        }
                        
                        NewExerciseButtonView()
                    }
                }
                .scrollIndicators(.hidden)
                
                HStack {
                    Text("Quad")
                        .font(.title2).bold()
                    Spacer()
                }
                
                ScrollView(.horizontal) {
                    HStack(spacing: exercise_card_spacing) {
                        ForEach(quad_exercises) {
                            ExerciseCardView(exercise: $0)
                        }
                        
                        NewExerciseButtonView()
                    }
                }
                .scrollIndicators(.hidden)
                
                HStack {
                    Text("Hamstring")
                        .font(.title2).bold()
                    Spacer()
                }
                
                ScrollView(.horizontal) {
                    HStack(spacing: exercise_card_spacing) {
                        ForEach(hamstring_exercises) {
                            ExerciseCardView(exercise: $0)
                        }
                        
                        NewExerciseButtonView()
                    }
                }
                .scrollIndicators(.hidden)
                
                HStack {
                    Text("Glute")
                        .font(.title2).bold()
                    Spacer()
                }
                
                ScrollView(.horizontal) {
                    HStack(spacing: exercise_card_spacing) {
                        ForEach(glute_exercises) {
                            ExerciseCardView(exercise: $0)
                        }
                        
                        NewExerciseButtonView()
                    }
                }
                .scrollIndicators(.hidden)
                
                HStack {
                    Text("Calve")
                        .font(.title2).bold()
                    Spacer()
                }
                
                ScrollView(.horizontal) {
                    HStack(spacing: exercise_card_spacing) {
                        ForEach(calve_exercises) {
                            ExerciseCardView(exercise: $0)
                        }
                        
                        NewExerciseButtonView()
                    }
                }
                .scrollIndicators(.hidden)
                
                HStack {
                    Text("Other")
                        .font(.title2).bold()
                    Spacer()
                }
                
                ScrollView(.horizontal) {
                    HStack(spacing: exercise_card_spacing) {
                        ForEach(other_strength_exercises) {
                            ExerciseCardView(exercise: $0)
                        }
                        
                        NewExerciseButtonView()
                    }
                }
                .scrollIndicators(.hidden)
            }
            .padding(.horizontal)
        }
    }
}
