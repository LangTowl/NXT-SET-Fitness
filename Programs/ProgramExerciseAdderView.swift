//
//  ProgramExerciseAdderView.swift
//  NXT SET
//
//  Created by Lang Towl on 10/2/23.
//

import SwiftUI
import SwiftData

// TODO: create a function that updates the ledger property in the exercise class to track which exercises programs are in, and what order they are in that program

struct ProgramExerciseAdderView: View {
    
    // Model context instantioation
    @Environment(\.modelContext) private var model_context
    @Query(filter: #Predicate<User> {$0.signed_in == true }) var user: [User]
    
    // Passed variable
    @Bindable var day: ProgramDay
    
    var body: some View {
        NavigationStack {
            Group {
                if user[0].exercises.isEmpty {
                    VStack {
                        Spacer()
                        
                        Text("No exercises detected")
                            .font(.title2)
                        
                        Image(systemName: "dumbbell")
                            .foregroundStyle(.red)
                        
                        Spacer()
                    }
                } else {
                    List {
                        ForEach(user[0].exercises) { exercise in
                            HStack {
                                Text(exercise.name)
                                
                                Spacer()
                                
                                Button {
                                    if is_exercise_in_program_day(day: day, exercise: exercise) == false {
                                        day.exercises.append(exercise)
                                        update_ledger(day: day, exercise: exercise)
                                    
                                        for i in 0...(exercise.ledger.count - 1) {
                                            print(exercise.ledger[i].index)
                                        }
                                        
                                    } else {
                                        day.exercises.remove(at: find_index_of_exercise(day: day, exercise: exercise))
                                    }
                                } label: {
                                    if is_exercise_in_program_day(day: day, exercise: exercise) == false {
                                        Text("Add")
                                            .foregroundStyle(.blue)
                                    } else {
                                        Text("Remove")
                                            .foregroundStyle(.red)
                                    }
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                }
            }
            .navigationTitle("Add Exercises")
        }
    }
}
