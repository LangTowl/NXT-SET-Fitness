//
//  ExerciseLibrary.swift
//  NXT SET Fitness
//
//  Created by Lang Towl on 7/24/23.
//

import SwiftUI

struct ExerciseLibrary: View {
    
    @State var active_view: String = "strength"
    
    var body: some View {
        NavigationStack {
            HStack {
                Picker("Exercise's type", selection: $active_view) {
                    ForEach(exercise_types, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
            }
            .padding()
            .navigationTitle("Exercise Library")
            
            ScrollView {
                switch active_view {
                case "strength":
                    StrengthExercisesView()
                case "cardio":
                    CardioExercisesView()
                default:
                    Text("Please select desired filter.")
                }
            }
            .navigationTitle("Exercise Library")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: NewExerciseView()) {
                        Text("Add")
                    }
                }
            }
        }
        .environment(\.colorScheme, .dark)
    }
}

#Preview {
    ExerciseLibrary()
}
