//
//  ProgramLibraryCardView.swift
//  NXT SET Fitness
//
//  Created by Lang Towl on 8/1/23.
//

import SwiftUI

struct ProgramLibraryCardView: View {
    
    @Bindable var program: Program
    
    var body: some View {
        ZStack {
            Rectangle()
                .background(.ultraThinMaterial)
                .environment(\.colorScheme, .light)
                .clipShape(RoundedRectangle(cornerRadius: program_card_corner_radius))
            
            VStack {
                Spacer()
                
                VStack {
                    HStack {
                        Text(program.name)
                            .font(.title).bold()
                        
                        Spacer()
                    }
                    .padding()
                    
                    Spacer()
                }
                .frame(height: program_card_height / 2)
            }
        }
        .frame(height: program_card_height)
    }
}
