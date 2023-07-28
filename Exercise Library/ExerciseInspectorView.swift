//
//  ExerciseInspectorView.swift
//  NXT SET Fitness
//
//  Created by Lang Towl on 7/27/23.
//

import SwiftUI

struct ExerciseInspectorView: View {
    @Environment(\.modelContext) private var model_context
    @Environment(\.dismiss) var dismiss_exercise_inspector
    
    @Bindable var exercise: Exercise
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Group {
                    switch exercise.type {
                    case "cardio":
                        HStack {
                            Text(exercise.cardio_type ?? "cardio")
                                .foregroundStyle(Color("pink_leading"))
                            
                            Image(systemName: "arrow.right")
                            
                            Text(exercise.cardio_metric ?? "metric")
                                .foregroundStyle(Color("blue_trailing"))
                            
                            Spacer()
                        }
                    case "strength":
                        HStack {
                            Text(exercise.strength_primary ?? "primary")
                                .foregroundStyle(Color("pink_leading"))
                            
                            Image(systemName: "arrow.right")
                            
                            Text(exercise.strength_secondary ?? "secondary")
                                .foregroundStyle(Color("blue_trailing"))
                            
                            Spacer()
                        }
                    default:
                        EmptyView()
                    }
                }
                .padding(.horizontal)
                
                ZStack {
                    Rectangle()
                        .background(.ultraThinMaterial)
                        .environment(\.colorScheme, .light)
                        .clipShape(RoundedRectangle(cornerRadius: exercise_card_corner_radius))
                    
                    Text("no aggregated stats").bold().opacity(0.8)
                }
                .frame(height: exercise_inspector_graph_height)
                .padding(.horizontal)
                
                HStack {
                    Text("Exercise summary")
                        .font(.title2)
                        .bold()
                    
                    Spacer()
                }
                .padding()
                
                Group {
                    switch exercise.type {
                    case "cardio":
                        switch exercise.cardio_metric {
                        case "distance":
                            HStack {
                                ExerciseInspectorStatBubbleView(value: exercise.cardio_distance ?? 0.0, metric: ".mi", icon: "ruler", icon_color: Color("pink_leading"), description: "active distance")
                                
                                ExerciseInspectorStatBubbleView(value: exercise.cardio_distance ?? 0.0, metric: ".mi", icon: "ruler", icon_color: Color("blue_trailing"), description: "total distance")
                            }
                        case "duration":
                            HStack {
                                ExerciseInspectorStatBubbleView(value: exercise.cardio_duration ?? 0.0, metric: ".min", icon: "ruler", icon_color: Color("pink_leading"), description: "active duration")
                                
                                ExerciseInspectorStatBubbleView(value: exercise.cardio_duration ?? 0.0, metric: ".min", icon: "clock", icon_color: Color("blue_trailing"), description: "total duration")
                            }
                        default:
                            EmptyView()
                        }
                    case "strength":
                        VStack {
                            HStack {
                                ExerciseInspectorStatBubbleView(value: exercise.strength_starting_weight ?? 0.0, metric: ".lbs", icon: "dumbbell", icon_color: Color("pink_leading"), description: "active starting weight")
                                
                                ExerciseInspectorStatBubbleView(value: 123, metric: "sets", icon: "number", icon_color: Color("blue_trailing"), description: "total sets completed")
                            }
                            
                            HStack {
                                ExerciseInspectorStatBubbleView(value: exercise.strength_workiing_weight ?? 0.0, metric: ".lbs", icon: "dumbbell", icon_color: Color("pink_leading"), description: "active working weight")
                                
                                ExerciseInspectorStatBubbleView(value: 469, metric: "reps", icon: "number", icon_color: Color("blue_trailing"), description: "total reps completed")
                            }
                            
                            HStack {
                                ExerciseInspectorStatBubbleView(value: exercise.strength_max_weight ?? 0.0, metric: ".lbs", icon: "dumbbell", icon_color: Color("pink_leading"), description: "active max weight")
                                
                                ExerciseInspectorStatBubbleView(value: 789, metric: ".lbs", icon: "scalemass", icon_color: Color("blue_trailing"), description: "total tonnage")
                            }
                        }
                    default:
                        EmptyView()
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle(exercise.name)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Button("Edit exercise") {
                            
                        }
                        
                        Button("Delete exercise") {
                            model_context.delete(exercise)
                            dismiss_exercise_inspector()
                        }
                    } label: {
                        Image(systemName: "gear")
                            .foregroundStyle(.white)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss_exercise_inspector()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.white)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
        .environment(\.colorScheme, .dark)
    }
}
