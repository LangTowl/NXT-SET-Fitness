//
//  ExerciseInspectorView.swift
//  NXT SET
//
//  Created by Lang Towl on 9/27/23.
//

import SwiftUI
import SwiftData

struct ExerciseInspectorView: View {
    
    // Model context instantiation
    @Environment(\.modelContext) private var model_context
    @Query(filter: #Predicate<User> {$0.signed_in == true }) var user: [User]
    
    // Enviromental variables
    @Environment(\.dismiss) var dismiss_exercise_insepctor_view
    
    // Passed variables
    @Bindable var exercise: Exercise
    
    var body: some View {
        NavigationStack {
            Group {
                switch exercise.type {
                case .strength:
                    List {
                        Section(footer: Text("Primary muscle.")) {
                            Text(exercise.primary_muscle!.rawValue)
                        }
                        
                        Section(footer: Text("Secondary muscle.")) {
                            Text(exercise.secondary_muscle!)
                        }
                        
                        Section(footer: Text("Staring weight.")) {
                            Text(String(exercise.starting_weight![0]))
                        }
                        
                        Section(footer: Text("Staring weight.")) {
                            Text(String(exercise.working_weight![0]))
                        }
                        
                        Section(footer: Text("Staring weight.")) {
                            Text(String(exercise.max_weight![0]))
                        }
                    }
                case .cardio:
                    List {
                        Section(footer: Text("Cardio exercise.")) {
                            Text(exercise.cardio_exercise!.rawValue)
                        }
                        
                        Section(footer: Text("Cardio type.")) {
                            Text(exercise.cardio_type!.rawValue)
                        }
                        
//                        Section(footer: Text(exercise.cardio_type == .distance ? "Distance (miles)" : "Duration (minutes)")) {
//                            Text(String(exercise.cardio_metric![0]))
//                        }
                    }
                }
            }
            .navigationTitle(exercise.name)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        let index = find_exercise(exercises: user[0].exercises, id: exercise.id)
                        
                        user[0].exercises.remove(at: index)
                        
                        dismiss_exercise_insepctor_view()
                    } label: {
                        Text("Delete")
                            .foregroundStyle(.red)
                            .bold()
                    }
                }
            }
        }
    }
}

//#Preview {
//    ExerciseInspectorView()
//}
