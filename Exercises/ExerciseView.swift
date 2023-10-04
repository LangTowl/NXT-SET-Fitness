//
//  ExerciseView.swift
//  NXT SET
//
//  Created by Lang Towl on 9/26/23.
//

import SwiftUI
import SwiftData

struct ExerciseView: View {
    
    // Model context instantiation
    @Environment(\.modelContext) private var model_context
    @Query(filter: #Predicate<User> {$0.signed_in == true }) var user: [User]
    
    var body: some View {
        NavigationStack {
            Group {
                if user.isEmpty  {
                    VStack {
                        Spacer()
                        Text("No active users detected")
                            .font(.title2)
                        Image(systemName: "person")
                            .font(.title3)
                            .foregroundStyle(.red)
                        Spacer()
                    }
                } else {
                    List {
                        ForEach(user[0].exercises) { exercise in
                            NavigationLink(destination: ExerciseInspectorView(exercise: exercise)) {
                                HStack {
                                    Text(exercise.name)
                                    
                                    Spacer()
                                    
                                    Image(systemName: exercise.type == .strength ? "dumbbell.fill" : "figure.run")
                                        .foregroundStyle(.green)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Exercises")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    if user.isEmpty {
                        Image(systemName: "plus")
                            .foregroundStyle(.gray)
                    } else {
                        NavigationLink(destination: NewExerciseView(user: user[0])) {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ExerciseView()
}
