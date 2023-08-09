//
//  ExerciseInspectorView.swift
//  NXT SET Beta 5
//
//  Created by Lang Towl on 8/8/23.
//

import SwiftUI
import SwiftData

struct ExerciseInspectorView: View {
    
    @Environment(\.modelContext) private var model_context
    @Environment(\.dismiss) var dismiss_exercise_inspector
    @Bindable var exercise: Exercise
    
    var body: some View {
        NavigationStack {
            ScrollView {
                switch exercise.type {
                case ExerciseType.strength.rawValue:
                    HStack {
                        Text(exercise.primary_muscle ?? "primary")
                            .foregroundStyle(Color("leading"))
                        
                        Image(systemName: "arrow.right")
                        
                        Text(exercise.secondary_muscle ?? "secondary")
                            .foregroundStyle(Color("trailing"))
                        
                        Spacer()
                    }
                case ExerciseType.cardio.rawValue:
                    HStack {
                        Text(exercise.cardio_type ?? "cardio")
                            .foregroundStyle(Color("leading"))
                        
                        Image(systemName: "arrow.right")
                        
                        Text(exercise.cardio_metric ?? "metric")
                            .foregroundStyle(Color("trailing"))
                        
                        Spacer()
                    }
                default:
                    EmptyView()
                }
            }
            .navigationTitle(exercise.name)
            .padding(.horizontal)
        }
        .environment(\.colorScheme, .dark)
    }
}
