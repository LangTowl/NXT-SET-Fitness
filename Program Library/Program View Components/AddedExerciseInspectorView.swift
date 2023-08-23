//
//  AddedExerciseInspectorView.swift
//  NXT SET Beta 5
//
//  Created by Lang Towl on 8/22/23.
//

import SwiftUI
import SwiftData

struct AddedExerciseInspectorView: View {
    
    @Environment(\.dismiss) var dismiss_page
    @Environment(\.modelContext) private var model_context
    
    var exercise: AddedExercise
    @State var sets: Int?
    @State var reps: Int?
    
    var body: some View {
        NavigationStack {
            Form {
                switch exercise.type {
                case ExerciseType.strength.rawValue:
                    Section(footer: Text("Enter the desired sets.")) {
                        TextField("\(String(exercise.sets))", value: $sets, format: .number)
                            .keyboardType(.numberPad)
                    }
                    
                    Section(footer: Text("Enter the desired reps.")) {
                        TextField("\(String(exercise.reps))", value: $reps, format: .number)
                            .keyboardType(.numberPad)
                    }
                case ExerciseType.cardio.rawValue:
                    EmptyView()
                default:
                    Text(exercise.type ?? "Fuck")
                }
                
                Text("Order: \(String(exercise.order ?? -1))")
                    .opacity(0.5)
            }
            .navigationTitle(exercise.name)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss_page()
                    } label: {
                        Text("Cancel")
                            .foregroundStyle(Color("leading"))
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        if sets != nil || reps != nil {
                            exercise.sets = sets ?? -1
                            exercise.reps = reps ?? -1
                            
                            try? model_context.save()
                            dismiss_page()
                        }
                    } label: {
                        if sets != nil || reps != nil {
                            Text("Save")
                                .foregroundStyle(Color("trailing"))
                                .bold()
                        } else {
                            Text("Save")
                                .foregroundStyle(.white)
                                .opacity(0.5)
                        }
                    }
                }
            }
        }
    }
}
