//
//  ExerciseInspectorGraphView.swift
//  NXT SET Fitness
//
//  Created by Lang Towl on 7/31/23.
//

import SwiftUI

struct ExerciseInspectorGraphView: View {
    
    var array: [Double]
    
    var date: [String] = ["01/07", "08/07", "15/07", "22/07", "09/09", "16/08", "23/08", "08/07", "01/07", "08/07"]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 5) {
                ForEach(0...(array.count - 1), id: \.self) { i in
                    VStack(alignment: .center) {
                        Spacer()
                        
                        Text(String(array[i]))
                            .font(.footnote)
                            .bold()
                            .opacity(0.5)
                        
                        Rectangle()
                            .frame(height: compute_graph_height(value: array[i]))
                            .foregroundStyle(
                                LinearGradient(colors: [Color("pink_leading"), Color("blue_trailing")], startPoint: .top, endPoint: .bottom)
                            )
                            .overlay(
                                Rectangle()
                                    .background(.ultraThinMaterial)
                                    .environment(\.colorScheme, .light)
                            )
                            .clipShape(RoundedRectangle(cornerRadius: exercise_card_corner_radius / 2))
                        
                        Text(date[i])
                            .font(.footnote)
                            .opacity(0.5)
                    }
                    .padding(.bottom, 7.5)
                }
            }
        }
        .scrollPosition(initialAnchor: .trailing)
        .padding(.horizontal)
        .overlay(
            RoundedRectangle(cornerRadius: exercise_card_corner_radius)
                .stroke(.white.opacity(0.5), lineWidth: 1)
        )
    }
}
