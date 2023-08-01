//
//  EditExerciseView.swift
//  NXT SET Fitness
//
//  Created by Lang Towl on 7/29/23.
//

import SwiftUI
import SwiftData

struct EditExerciseView: View {

    @Environment(\.modelContext) private var model_context
    @Bindable var exercise: Exercise
    
    var body: some View {
        NavigationStack {
            Form {
                Section(footer: Text("Edit the name of this exercise")) {
                    TextField("\(exercise.name)", text: $exercise.name)
                }
                
                Section(footer: Text("This action cannot be undone.")) {
                    Button {
                        model_context.delete(exercise)
                    } label: {
                        Text("Delete this exercise")
                            .foregroundStyle(Color("pink_leading")).bold()
                    }
                }
            }
            .navigationTitle("Edit Exercise")
            .padding(.top)
        }
        .environment(\.colorScheme, .dark)
    }
}
