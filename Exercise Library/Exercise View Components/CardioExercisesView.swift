//
//  CardioExercisesView.swift
//  NXT SET Beta 5
//
//  Created by Lang Towl on 8/8/23.
//

import SwiftUI
import SwiftData

struct CardioExercisesView: View {
    
    @Environment(\.modelContext) private var model_context
    @Query(filter: #Predicate<Exercise> {$0.type == "cardio" }) var cardio_exercises: [Exercise]
    
    var running_exercises: [Exercise] {
        cardio_exercises.filter { $0.cardio_type == CardioType.running.rawValue}
    }
    
    var walking_exercises: [Exercise] {
        cardio_exercises.filter { $0.cardio_type == CardioType.walking.rawValue}
    }
    
    var swimming_exercises: [Exercise] {
        cardio_exercises.filter { $0.cardio_type == CardioType.swimming.rawValue}
    }
    
    var cycling_exercises: [Exercise] {
        cardio_exercises.filter { $0.cardio_type == CardioType.cycling.rawValue}
    }
    
    var rowing_exercises: [Exercise] {
        cardio_exercises.filter { $0.cardio_type == CardioType.rowing.rawValue}
    }
    
    var stairs_exercises: [Exercise] {
        cardio_exercises.filter { $0.cardio_type == CardioType.stairs.rawValue}
    }
    
    var other_cardio_exercises: [Exercise] {
        cardio_exercises.filter { $0.cardio_type == CardioType.other.rawValue}
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
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
                .scrollIndicators(.hidden)
                
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
                .scrollIndicators(.hidden)
                
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
                .scrollIndicators(.hidden)
                
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
                .scrollIndicators(.hidden)
                
                HStack {
                    Text("Rowing")
                        .font(.title2).bold()
                    Spacer()
                }
                
                ScrollView(.horizontal) {
                    HStack(spacing: exercise_card_spacing) {
                        ForEach(rowing_exercises) {
                            ExerciseCardView(exercise: $0)
                        }
                        
                        NewExerciseButtonView()
                    }
                }
                .scrollIndicators(.hidden)
                
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
                .scrollIndicators(.hidden)
                
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
                .scrollIndicators(.hidden)
            }
            .padding(.horizontal)
        }
    }
}
