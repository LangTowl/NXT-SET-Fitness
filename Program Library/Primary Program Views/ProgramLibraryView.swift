//
//  ProgramLibraryView.swift
//  NXT SET Beta 5
//
//  Created by Lang Towl on 8/8/23.
//

import SwiftUI
import SwiftData

struct ProgramLibraryView: View {
    
    @Environment(\.modelContext) private var model_context
    @Query private var programs: [Program]
    
    @State private var show_popover: Bool = false
    @State var name: String = ""
    @State var type: ProgramType = .daily
    
    var is_form_complete: Bool {
        if name != "" {
            return true
        }
        
        return false
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(programs) {
                    ProgramLibraryCardView(program: $0)
                        .padding(.horizontal)
                }
            }
            .navigationTitle("Program Library")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        show_popover.toggle()
                    } label: {
                        Text("Add")
                            .foregroundStyle(Color("trailing"))
                            .bold()
                    }
                }
            }
            .sheet(isPresented: $show_popover) {
                NavigationStack {
                    Group {
                        Form {
                            Section(footer: Text("Name this program.")) {
                                TextField("Name", text: $name)
                            }
                            
                            Section(footer: type == .daily ? Text("Daily programs repeat after a predetermined amount of time.") : Text("Weekly programs repeat after each week, starting on Monday and ending on Sunday.")) {
                                Picker("Program type", selection: $type) {
                                    ForEach(ProgramType.allCases, id: \.self) { type in
                                        Text(type.rawValue)
                                    }
                                }
                                .pickerStyle(.segmented)
                            }
                        }
                    }
                    .navigationTitle("New Program")
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Button {
                                show_popover.toggle()
                            } label: {
                                Text("Cancel")
                                    .foregroundStyle(Color("leading"))
                            }
                        }
                        
                        ToolbarItem(placement: .topBarTrailing) {
                            Button {
                                let new_program = Program(name: name, type: type.rawValue)
                                model_context.insert(new_program)
                                show_popover.toggle()
                            } label: {
                                if is_form_complete == true {
                                    Text("Add")
                                        .foregroundStyle(Color("trailing"))
                                        .bold()
                                } else {
                                    Text("Add")
                                        .foregroundStyle(.gray)
                                }
                            }
                        }
                    }
                }
                .presentationDetents([.medium])
                .environment(\.colorScheme, .dark)
                .presentationBackground(.ultraThinMaterial)
            }
        }
        .environment(\.colorScheme, .dark)
    }
}
