//
//  ExerciseCardView.swift
//  NXT SET Beta 5
//
//  Created by Lang Towl on 8/8/23.
//

import SwiftUI

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
                    }
                    .frame(width: exercise_card_width, height: exercise_card_height)
                }
                
                switch exercise.type {
                case ExerciseType.strength.rawValue:
                    HStack {
                        Text(exercise.primary_muscle ?? "primary")
                            .foregroundStyle(Color("leading"))
                            .font(.footnote)
                        Image(systemName: "arrow.right")
                            .font(.footnote)
                        Text(exercise.secondary_muscle ?? "secondary")
                            .foregroundStyle(Color("trailing"))
                            .font(.footnote)
                        Spacer()
                    }
                    .padding(.leading)
                case ExerciseType.cardio.rawValue:
                    HStack {
                        Text(exercise.cardio_type ?? "cardio")
                            .foregroundStyle(Color("leading"))
                            .font(.footnote)
                        Image(systemName: "arrow.right")
                            .font(.footnote)
                        Text(exercise.cardio_metric ?? "metric")
                            .foregroundStyle(Color("trailing"))
                            .font(.footnote)
                        Spacer()
                    }
                    .padding(.leading)
                default:
                    EmptyView()
                }
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}
