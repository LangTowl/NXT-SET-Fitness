//
//  ProgramLibraryCardView.swift
//  NXT SET Beta 5
//
//  Created by Lang Towl on 8/8/23.
//

import SwiftUI
import SwiftData

struct ProgramLibraryCardView: View {
    
    @Bindable var program: Program
    @Query private var programs: [Program]
    
    var body: some View {
        ZStack {
            Rectangle()
                .background(.ultraThinMaterial)
                .environment(\.colorScheme, .light)
                .clipShape(RoundedRectangle(cornerRadius: program_card_corner_radius))
            
            VStack {
                HStack {
                    Spacer()
                    
                    Button {
                        for i in 0...(programs.count - 1) {
                            if programs[i].name == program.name {
                                programs[i].active = true
                            } else {
                                programs[i].active = false
                            }
                        }
                    } label: {
                        Text(program.active == true ? "deactivate" : "activate")
                            .foregroundStyle(.white)
                            .bold()
                    }
                }
                .padding()
                
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
