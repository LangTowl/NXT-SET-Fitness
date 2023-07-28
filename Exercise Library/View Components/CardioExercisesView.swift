//
//  CardioExercisesView.swift
//  NXT SET Fitness
//
//  Created by Lang Towl on 7/25/23.
//

import SwiftUI
import SwiftData

struct CardioExercisesView: View {
    
    @Environment(\.modelContext) private var model_context
    @Query(filter: #Predicate {$0.type == "cardio" }) var cardio_exercises: [Exercise]
    
    var running_exercises: [Exercise] {
        cardio_exercises.filter { $0.cardio_type == "running"}
    }
    
    var walking_exercises: [Exercise] {
        cardio_exercises.filter { $0.cardio_type == "walking"}
    }
    
    var swimming_exercises: [Exercise] {
        cardio_exercises.filter { $0.cardio_type == "swimming"}
    }
    
    var cycling_exercises: [Exercise] {
        cardio_exercises.filter { $0.cardio_type == "cycling"}
    }
    
    var rowing_exercises: [Exercise] {
        cardio_exercises.filter { $0.cardio_type == "rowing"}
    }
    
    var stairs_exercises: [Exercise] {
        cardio_exercises.filter { $0.cardio_type == "stairs"}
    }
    
    var other_cardio_exercises: [Exercise] {
        cardio_exercises.filter { $0.cardio_type == "other"}
    }
    
    var body: some View {
        NavigationStack {
            Group {
                HStack {
                    Text("Running")
                        .font(.title2).bold()
                    
                    Spacer()
                }
                
                ScrollView(.horizontal) {
                    HStack(spacing: exercise_card_spacing) {
                        ForEach(running_exercises) {
                            ExerciseCardView(exercise: $0)
                        }
                        
                        NewExerciseButtonView()
                    }
                }
                
                HStack {
                    Text("Walking")
                        .font(.title2).bold()
                    
                    Spacer()
                }
                
                ScrollView(.horizontal) {
                    HStack(spacing: exercise_card_spacing) {
                        ForEach(walking_exercises) {
                            ExerciseCardView(exercise: $0)
                        }
                        
                        NewExerciseButtonView()
                    }
                }
                
                HStack {
                    Text("Swimming")
                        .font(.title2).bold()
                    
                    Spacer()
                }
                
                ScrollView(.horizontal) {
                    HStack(spacing: exercise_card_spacing) {
                        ForEach(swimming_exercises) {
                            ExerciseCardView(exercise: $0)
                        }
                        
                        NewExerciseButtonView()
                    }
                }
                
                HStack {
                    Text("Cycling")
                        .font(.title2).bold()
                    
                    Spacer()
                }
                
                ScrollView(.horizontal) {
                    HStack(spacing: exercise_card_spacing) {
                        ForEach(cycling_exercises) {
                            ExerciseCardView(exercise: $0)
                        }
                        
                        NewExerciseButtonView()
                    }
                }
                
                HStack {
                    Text("Stairs")
                        .font(.title2).bold()
                    
                    Spacer()
                }
                
                ScrollView(.horizontal) {
                    HStack(spacing: exercise_card_spacing) {
                        ForEach(stairs_exercises) {
                            ExerciseCardView(exercise: $0)
                        }
                        
                        NewExerciseButtonView()
                    }
                }
                
                HStack {
                    Text("Other")
                        .font(.title2).bold()
                    
                    Spacer()
                }
                
                ScrollView(.horizontal) {
                    HStack(spacing: exercise_card_spacing) {
                        ForEach(other_cardio_exercises) {
                            ExerciseCardView(exercise: $0)
                        }
                        
                        NewExerciseButtonView()
                    }
                }
            }
            .padding(.horizontal)
        }
        .environment(\.colorScheme, .dark)
    }
}

#Preview {
    CardioExercisesView()
}
