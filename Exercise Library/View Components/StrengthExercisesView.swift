//
//  StrengthExercisesView.swift
//  NXT SET Fitness
//
//  Created by Lang Towl on 7/25/23.
//

import SwiftUI
import SwiftData

struct StrengthExercisesView: View {
    
    @Environment(\.modelContext) private var model_context
    @Query(filter: #Predicate {$0.type == "strength" }) var strength_exercises: [Exercise]
    
    var chest_exercises: [Exercise] {
        strength_exercises.filter { $0.strength_primary == "chest"}
    }
    
    var back_exercises: [Exercise] {
        strength_exercises.filter { $0.strength_primary == "back"}
    }
    
    var shoulder_exercises: [Exercise] {
        strength_exercises.filter { $0.strength_primary == "shoulder"}
    }
    
    var tricep_exercises: [Exercise] {
        strength_exercises.filter { $0.strength_primary == "tricep"}
    }
    
    var bicep_exercises: [Exercise] {
        strength_exercises.filter { $0.strength_primary == "bicep"}
    }
    
    var forearm_exercises: [Exercise] {
        strength_exercises.filter { $0.strength_primary == "forearm"}
    }
    
    var core_exercises: [Exercise] {
        strength_exercises.filter { $0.strength_primary == "core"}
    }
    
    var quad_exercises: [Exercise] {
        strength_exercises.filter { $0.strength_primary == "quad"}
    }
    
    var hamstring_exercises: [Exercise] {
        strength_exercises.filter { $0.strength_primary == "hamstring"}
    }
    
    var glute_exercises: [Exercise] {
        strength_exercises.filter { $0.strength_primary == "glute"}
    }
    
    var calve_exercises: [Exercise] {
        strength_exercises.filter { $0.strength_primary == "calve"}
    }
    
    var other_strength_exercises: [Exercise] {
        strength_exercises.filter { $0.strength_primary == "other"}
    }
    
    var body: some View {
        NavigationStack {
            Group {
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
                    Text("Shoulders")
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
        .environment(\.colorScheme, .dark)
    }
}

#Preview {
    StrengthExercisesView()
}
