//
//  NewProgramView.swift
//  NXT SET
//
//  Created by Lang Towl on 9/27/23.
//

import SwiftUI
import SwiftData

struct NewProgramView: View {
    
    // Model context instantiation
    @Environment(\.modelContext) private var model_context
    
    // Enviromental variables
    @Environment(\.dismiss) var dismiss_new_program_view
    
    // New program variables
    @State private var name: String = ""
    @State private var type: ProgramType = .weekly
    
    // Passed variables
    @Bindable var user: User
    
    var body: some View {
        NavigationStack {
            Form {
                Section(footer: Text("Enter desired program name.")) {
                    TextField("Name", text: $name)
                        .autocapitalization(.none)
                }
                
                Section(footer: Text("Choose program structure.")) {
                    Picker("Slect program type.", selection: $type) {
                        ForEach(ProgramType.allCases, id: \.self) { option in
                            Text(option.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
            .navigationTitle("New Program")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        if name != "" {
                            let new_program = Program(name: name, type: type)
                            
                            user.programs.append(new_program)
                            
                            dismiss_new_program_view()
                        }
                    } label: {
                        Text("Finish")
                    }
                }
            }
        }
    }
}

//#Preview {
//    NewProgramView()
//}
