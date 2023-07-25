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
        NavigationLink(destination: Text("Here")) {
            VStack {
                ZStack {
                    Rectangle()
                        .background(.ultraThinMaterial)
                        .environment(\.colorScheme, .light)
                        .frame(width: exercise_card_width, height: exercise_card_height)
                    
                    VStack {
                        HStack {
                            Text(exercise.name)
                            
                            Spacer()
                        }
                        .padding()
                        
                        Spacer()
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: exercise_card_corner_radius))
                
                Group {
                    switch exercise.type {
                    case "cardio":
                        Text("Cardio \(Image(systemName: "arrow.right")) Metric")
                    case "strength":
                        Text("Primary \(Image(systemName: "arrow.right")) Secondary")
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
