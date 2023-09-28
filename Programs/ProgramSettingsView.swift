//
//  ProgramSettingsView.swift
//  NXT SET
//
//  Created by Lang Towl on 9/27/23.
//

import SwiftUI
import SwiftData

struct ProgramSettingsView: View {
    
    // Model context instantiation
    @Environment(\.modelContext) private var model_context
    @Query private var programs: [Program]
    
    // Passed variables
    @Bindable var program: Program
    
    var body: some View {
        NavigationStack {
            Form {
                Section(footer: Text("Setting this program as 'active' will deactive all other programs.")) {
                    Button {
                        program.activate_program.toggle()
                        verify_active_program(program: program, program_list: programs)
                    } label: {
                        Text(program.activate_program == true ? "Deactive program" : "Activate program")
                            .foregroundStyle(program.activate_program == true ? .red : .green)
                    }
                }
            }
            .navigationTitle("Program settings")
        }
    }
}

//#Preview {
//    ProgramSettingsView()
//}
