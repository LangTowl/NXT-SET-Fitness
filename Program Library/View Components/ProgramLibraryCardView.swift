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
                    
                    NavigationLink(destination: ProgramInspectorView(program: program)) {
                        
                        HStack {
                            Spacer()
                            Text("Program Inspector")
                                .foregroundStyle(Color("pink_leading"))
                            Spacer()
                        }
                    }
                    
                    Spacer()
                }
                .frame(height: program_card_height / 2)
                .background(
                    Rectangle()
                        .foregroundStyle(Color("blue_trailing"))
                        .opacity(0.5)
                        .clipShape(RoundedRectangle(cornerRadius: program_card_corner_radius))
                )
            }
        }
        .frame(height: program_card_height)
    }
}
