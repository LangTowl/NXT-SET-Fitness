//
//  ExerciseLibraryView.swift
//  NXT SET Beta 5
//
//  Created by Lang Towl on 8/5/23.
//

import SwiftUI

struct ExerciseLibraryView: View {
    
    @State var active_view: ExerciseType = .strength
    
    var body: some View {
        NavigationStack {
            Group {
                switch active_view {
                case .strength:
                    StrengthExercisesView()
                case .cardio:
                    CardioExercisesView()
                }
            }
            .padding(.top)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: NewExerciseView()) {
                        Image(systemName: "plus")
                            .foregroundStyle(Color("trailing"))
                            .bold()
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        withAnimation {
                            active_view = .strength
                        }
                    } label: {
                        Text("Strength")
                            .font(.largeTitle).bold()
                            .foregroundStyle(active_view == .strength ? .white : .white.opacity(0.5))
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        withAnimation {
                            active_view = .cardio
                        }
                    } label: {
                        Text("Cardio")
                            .font(.largeTitle).bold()
                            .foregroundStyle(active_view == .cardio ? .white : .white.opacity(0.5))
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
        .environment(\.colorScheme, .dark)
    }
}
