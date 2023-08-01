//
//  ExerciseCardView.swift
//  NXT SET Fitness
//
//  Created by Lang Towl on 7/25/23.
//

import SwiftUI

struct ExerciseCardView: View {
    
    @Bindable var exercise: Exercise
    
    var body: some View {
        NavigationLink(destination: ExerciseInspectorView(exercise: exercise)) {
            VStack {
                ZStack {
                    Rectangle()
                        .background(.ultraThinMaterial)
                        .environment(\.colorScheme, .light)
                        .clipShape(RoundedRectangle(cornerRadius: exercise_card_corner_radius))
                        .frame(width: exercise_card_width, height: exercise_card_height)
                    
                    VStack {
                        HStack {
                            Text(exercise.name)
                                .bold()
                            Spacer()
                        }
                        .padding(.horizontal)
                        .padding(.top)
                        .lineLimit(0)
                        .frame(width: exercise_card_width)
                        
                        Spacer()
                        
                        ExerciseCardGraphView()
                    }
                    .frame(width: exercise_card_width, height: exercise_card_height)
                }
                
                Group {
                    switch exercise.type{
                    case "cardio":
                        HStack {
                            Text(exercise.cardio_type ?? "cardio")
                                .foregroundStyle(Color("pink_leading"))
                            Image(systemName: "arrow.right")
                            Text(exercise.cardio_metric ?? "metric")
                                .foregroundStyle(Color("blue_trailing"))
                            Spacer()
                        }
                        .lineLimit(0)
                        .frame(width: exercise_card_width)
                        .font(.footnote)
                        .offset(x: 7.5)
                    case "strength":
                        HStack {
                            Text(exercise.strength_primary ?? "primary")
                                .foregroundStyle(Color("pink_leading"))
                            Image(systemName: "arrow.right")
                            Text(exercise.strength_secondary ?? "secondary")
                                .foregroundStyle(Color("blue_trailing"))
                            Spacer()
                        }
                        .lineLimit(0)
                        .frame(width: exercise_card_width)
                        .font(.footnote)
                        .offset(x: 7.5)
                    default:
                        EmptyView()
                    }
                }
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}
