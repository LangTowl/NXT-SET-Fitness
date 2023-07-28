//
//  ExerciseCardView.swift
//  NXT SET Fitness
//
//  Created by Lang Towl on 7/25/23.
//

import SwiftUI

struct ExerciseCardView: View {
    
    var exercise: Exercise
    
    var body: some View {
        NavigationLink(destination: ExerciseInspectorView(exercise: exercise)) {
            VStack {
                ZStack {
                    Rectangle()
                        .background(.ultraThinMaterial)
                        .environment(\.colorScheme, .light)
                        .frame(width: exercise_card_width, height: exercise_card_height)
                    
                    VStack {
                        HStack {
                            Text(exercise.name)
                                .font(.title3).bold()
                            
                            Spacer()
                        }
                        .padding(.top)
                        .padding(.horizontal)
                        
                        switch exercise.type {
                        case "cardio":
                            switch exercise.cardio_metric {
                            case "distance":
                                Group {
                                    HStack {
                                        Text("\(String(exercise.cardio_distance ?? 0))")
                                            .font(.subheadline)
                                        
                                        Text("distance .mi")
                                            .opacity(0.5)
                                            .font(.footnote)
                                        
                                        Spacer()
                                    }
                                }
                                .padding(.horizontal)
                            case "duration":
                                Group {
                                    HStack {
                                        Text("\(String(exercise.cardio_duration ?? 0))")
                                            .font(.subheadline)
                                        
                                        Text("duration .min")
                                            .opacity(0.5)
                                            .font(.footnote)
                                        
                                        Spacer()
                                    }
                                }
                                .padding(.horizontal)
                            default:
                                EmptyView()
                            }
                        case "strength":
                            Group {
                                HStack {
                                    Text("\(String(exercise.strength_starting_weight ?? 0))")
                                        .font(.subheadline)
                                    
                                    Text("starting .lbs")
                                        .opacity(0.5)
                                        .font(.footnote)
                                    
                                    Spacer()
                                }
                                
                                HStack {
                                    Text("\(String(exercise.strength_workiing_weight ?? 0))")
                                        .font(.subheadline)
                                    
                                    Text("working .lbs")
                                        .opacity(0.5)
                                        .font(.footnote)
                                    
                                    Spacer()
                                }
                                
                                HStack {
                                    Text("\(String(exercise.strength_max_weight ?? 0))")
                                        .font(.subheadline)
                                    
                                    Text("max .lbs")
                                        .opacity(0.5)
                                        .font(.footnote)
                        
                                    Spacer()
                                }
                            }
                            .padding(.horizontal)
                            
                            Group {
                                
                            }
                            .padding(.horizontal)
                        default:
                            EmptyView()
                        }
                        
                        Spacer()
                        
                        ExerciseCardGraphView()
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: exercise_card_corner_radius))
                
                Group {
                    switch exercise.type {
                    case "cardio":
                        HStack {
                            Text(exercise.cardio_type ?? "Cardio type")
                            Image(systemName: "arrow.right")
                            Text(exercise.cardio_metric ?? "Cardio metric")
                        }
                    case "strength":
                        HStack {
                            Text(exercise.strength_primary ?? "Primary muscle")
                            Image(systemName: "arrow.right")
                            Text(exercise.strength_secondary ?? "Secondary muscle")
                        }
                    default:
                        Text("ERROR no type found")
                    }
                }
                .lineLimit(0)
                .opacity(0.5)
                .font(.footnote)
                .frame(width: exercise_card_width)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}
