//
//  ExerciseCardGraphView.swift
//  NXT SET Fitness
//
//  Created by Lang Towl on 7/27/23.
//

import SwiftUI

struct ExerciseCardGraphView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(
                    LinearGradient(colors: [Color("pink_leading"), Color("blue_trailing")], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .padding()
            
            Rectangle()
                .background(.ultraThinMaterial)
                .environment(\.colorScheme, .light)
            
            Text("no data aggregated")
                .font(.footnote).opacity(0.5)
        }
        .frame(width: exercise_card_width, height: exercise_card_height / 3.5)
        .clipShape(RoundedRectangle(cornerRadius: exercise_card_corner_radius))
    }
}

#Preview {
    ExerciseCardGraphView()
}
