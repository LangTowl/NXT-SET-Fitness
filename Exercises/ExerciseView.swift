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
    @Query private var exercises: [Exercise]
    
    var body: some View {
        NavigationStack {
            List {
                if exercises.isEmpty {
                    EmptyView()
                } else {
                    ForEach(exercises) { exercise in
                        Text(exercise.name)
                    }
                }
            }
            .navigationTitle("Exercises")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        let new_exerise = Exercise(name: "Test", type: .strength)
                        model_context.insert(new_exerise)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    ExerciseView()
}
