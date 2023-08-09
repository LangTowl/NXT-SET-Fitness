//
//  NewExerciseButtonView.swift
//  NXT SET Beta 5
//
//  Created by Lang Towl on 8/8/23.
//

import SwiftUI

struct NewExerciseButtonView: View {
    var body: some View {
        NavigationStack {
            NavigationLink(destination: NewExerciseView()) {
                VStack {
                    ZStack {
                        Rectangle()
                            .background(.ultraThinMaterial)
                            .environment(\.colorScheme, .light)
                        
                        Image(systemName: "plus")
                            .font(.largeTitle)
                    }
                    .frame(width: exercise_card_width, height: exercise_card_height)
                    .clipShape(RoundedRectangle(cornerRadius: exercise_card_corner_radius))
                    
                    
                    Text("create new exercise")
                        .font(.footnote)
                        .opacity(0.5)
                }
            }
            .buttonStyle(PlainButtonStyle())
        }
        .environment(\.colorScheme, .dark)
    }
}
