//
//  ProgramLibraryCardView.swift
//  NXT SET Beta 5
//
//  Created by Lang Towl on 8/8/23.
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
                                .foregroundStyle(Color("leading"))
                            Spacer()
                        }
                    }
                    
                    Spacer()
                }
                .frame(height: program_card_height / 2)
                .background(
                    Rectangle()
                        .foregroundStyle(Color("trailing"))
                        .opacity(0.5)
                        .clipShape(RoundedRectangle(cornerRadius: program_card_corner_radius))
                )
            }
        }
        .frame(height: program_card_height)
    }
}
