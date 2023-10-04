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
    @Query(filter: #Predicate<User> {$0.signed_in == true }) var user: [User]
    
    // Environmental variables
    @Environment(\.dismiss) var dissmiss_program_settings_view
    
    // Passed variables
    @Bindable var program: Program
    
    var body: some View {
        NavigationStack {
            Form {
                Section(footer: Text("Setting this program as 'active' will deactive all other programs.")) {
                    Button {
                        program.activate_program.toggle()
                        verify_active_program(program: program, program_list: user[0].programs)
                    } label: {
                        Text(program.activate_program == true ? "Deactive program" : "Activate program")
                            .foregroundStyle(program.activate_program == true ? .red : .green)
                    }
                }
                
                Section(footer: Text("This action cannot be undone.")) {
                    Button {
                        let index = find_program(programs: user[0].programs, id: program.id)
                        
                        user[0].programs.remove(at: index)
                        
                        dissmiss_program_settings_view()
                    } label: {
                        Text("Delete this program")
                            .foregroundStyle(.red)
                            .bold()
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
