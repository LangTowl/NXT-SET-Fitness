//
//  ExerciseInspectorStatBubbleView.swift
//  NXT SET Fitness
//
//  Created by Lang Towl on 7/28/23.
//

import SwiftUI

struct ExerciseInspectorStatBubbleView: View {
    
    var value: Double
    var metric: String
    var icon: String
    var icon_color: Color
    var description: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .background(.ultraThinMaterial)
                .environment(\.colorScheme, .light)
            
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text(String(value))
                            .font(.title3)
                            .bold()
                            .foregroundStyle(icon_color)
                        
                        Text(metric)
                            .font(.footnote)
                            .opacity(0.5)
                    }
                    
                    Spacer()
                    
                    Image(systemName: icon)
                        .foregroundStyle(icon_color)
                        .font(.title)
                }
                
                HStack {
                    Text(description)
                        .font(.footnote)
                    
                    Spacer()
                }
            }
            .padding()
        }
        .frame(height: exercise_inspector_bubble_height)
        .clipShape(RoundedRectangle(cornerRadius: exercise_card_corner_radius))
    }
}
