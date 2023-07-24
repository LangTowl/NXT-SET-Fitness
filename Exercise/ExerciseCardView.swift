//
//  ExerciseCardView.swift
//  NXT SET Fitness
//
//  Created by Lang Towl on 7/23/23.
//

import SwiftUI

struct ExerciseCardView: View {
    
    let width: Double = UIScreen.main.bounds.width
    let height: Double = UIScreen.main.bounds.height
    
    var body: some View {
        ZStack {
            VStack {
                Rectangle()
                    .frame(width: width / 2, height: width / 2)
                    .background(.ultraThinMaterial)
                    .environment(\.colorScheme, .light)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                
                Text("Primary \(Image(systemName: "arrow.right")) Secondary")
                    .lineLimit(0)
                    .frame(width: width / 2)
                    .opacity(0.8)
            }
            
            VStack {
                HStack {
                    Text("Exercise name")
                        .font(.title).bold()
                    
                    Spacer()
                }
                
                Spacer()
            }
            .padding()
            .frame(width: width / 2, height: width / 2)
        }
    }
}

#Preview {
    ExerciseCardView()
}
