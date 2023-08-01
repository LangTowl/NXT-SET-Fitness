//
//  ProgramLibrary.swift
//  NXT SET Fitness
//
//  Created by Lang Towl on 8/1/23.
//

import SwiftUI
import SwiftData

struct ProgramLibrary: View {
    
    @Environment(\.modelContext) private var model_context
    @Query private var programs: [Program]
    
    @State var show_popover: Bool = false
    @State var new_program_name: String = ""
    @State var new_program_type: String = "daily"
    
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
                            .foregroundStyle(Color("blue_trailing"))
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .sheet(isPresented: $show_popover) {
                NavigationStack {
                    Form {
                        Section(footer: Text("Name this program.")) {
                            TextField("Name", text: $new_program_name)
                        }
                        
                        Section(footer: new_program_type == "daily" ? Text("Daily programs repeat after a predetermined amount of time.") : Text("Weekly programs repeat after each week, starting on Monday and ending on Sunday.")) {
                            Picker("Program type", selection: $new_program_type) {
                                ForEach(program_types, id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(.segmented)
                        }
                    }
                    .navigationTitle("New Program")
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Button {
                                show_popover.toggle()
                            } label: {
                                Text("Cancel")
                                    .foregroundStyle(Color("pink_leading"))
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        
                        ToolbarItem(placement: .topBarTrailing) {
                            Button {
                                let new_program = Program(name: new_program_name, type: new_program_type)
                                model_context.insert(new_program)
                                show_popover.toggle()
                            } label: {
                                Text("Add")
                                    .foregroundStyle(Color("blue_trailing"))
                                    .bold()
                            }
                            .buttonStyle(PlainButtonStyle())
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

#Preview {
    ProgramLibrary()
}
