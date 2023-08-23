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
                
                ZStack {
                    Rectangle()
                        .frame(width: exercise_inspector_graph_width, height: exercise_inspector_graph_height)
                        .background(.ultraThinMaterial)
                        .environment(\.colorScheme, .light)
                        .clipShape(RoundedRectangle(cornerRadius: exercise_card_corner_radius))
                    
                    Text("No Stats Aggregated")
                        .font(.title)
                        .opacity(0.5)
                }
                
                switch exercise.type {
                case ExerciseType.strength.rawValue:
                    VStack {
                        HStack {
                            ExerciseInspectorStatBubbleView(value: exercise.starting_weight ?? 0.0, metric: ".lbs", icon: "dumbbell", icon_color: Color("leading"), description: "active starting weight")
                            
                            ExerciseInspectorStatBubbleView(value: 123, metric: "sets", icon: "number", icon_color: Color("trailing"), description: "total sets completed")
                        }
                        
                        HStack {
                            ExerciseInspectorStatBubbleView(value: exercise.working_weight ?? 0.0, metric: ".lbs", icon: "dumbbell", icon_color: Color("leading"), description: "active working weight")
                            
                            ExerciseInspectorStatBubbleView(value: 469, metric: "reps", icon: "number", icon_color: Color("trailing"), description: "total reps completed")
                        }
                        
                        HStack {
                            ExerciseInspectorStatBubbleView(value: exercise.max_weight ?? 0.0, metric: ".lbs", icon: "dumbbell", icon_color: Color("leading"), description: "active max weight")
                            
                            ExerciseInspectorStatBubbleView(value: 789, metric: ".lbs", icon: "scalemass", icon_color: Color("trailing"), description: "total tonnage")
                        }
                    }
                case ExerciseType.cardio.rawValue:
                    switch exercise.cardio_metric {
                    case CardioMetric.distance.rawValue:
                        HStack {
                            ExerciseInspectorStatBubbleView(value: (exercise.distance ?? 0.0), metric: ".mi", icon: "ruler", icon_color: Color("leading"), description: "active distance")
                            
                            ExerciseInspectorStatBubbleView(value: (exercise.distance ?? 0.0), metric: ".mi", icon: "ruler", icon_color: Color("blue_trailing"), description: "total distance")
                        }
                    case CardioMetric.duration.rawValue:
                        HStack {
                            ExerciseInspectorStatBubbleView(value: (exercise.duration ?? 0.0), metric: ".min", icon: "ruler", icon_color: Color("leading"), description: "active duration")
                            
                            ExerciseInspectorStatBubbleView(value: (exercise.duration ?? 0.0), metric: ".min", icon: "clock", icon_color: Color("trailing"), description: "total duration")
                        }
                    default:
                        EmptyView()
                    }
                default:
                    EmptyView()
                }
            }
            .navigationTitle(exercise.name)
            .padding(.horizontal)
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss_exercise_inspector()
                    } label: {
                        Image(systemName: "chevron.left")
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        // Add edit functionality
                    } label: {
                        Text("Edit")
                            .foregroundStyle(Color("trailing"))
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
        .environment(\.colorScheme, .dark)
    }
}
