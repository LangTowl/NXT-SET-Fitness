//
//  ProgramInspectorView.swift
//  NXT SET
//
//  Created by Lang Towl on 9/27/23.
//

import SwiftUI

struct ProgramInspectorView: View {
    
    // Passed variable
    @Bindable var program: Program
    
    // State variables
    @State var focus: UUID = UUID()
    @State var change_day_name: Bool = false
    @State var add_new_day: Bool = false
    @State var new_day_name: String = ""
    
    // Computed properties
    var ordered_days: [ProgramDay] {
        program.program_days.sorted(by: { $0.index < $1.index })
    }
    
    var focused_day: ProgramDay {
        for i in 0...(ordered_days.count - 1) {
            if ordered_days[i].id == focus {
                return ordered_days[i]
            }
        }
        
        return ordered_days[0]
    }
    
    var ordered_exercises: [Exercise] {
        focused_day.exercises.sorted(by: { find_in_ledger(day: focused_day, exercise: $0) < find_in_ledger(day: focused_day, exercise: $1) })
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0...(ordered_days.count - 1), id: \.self) { i in
                        Button {
                            focus = ordered_days[i].id
                        } label: {
                            Group {
                                switch program.type {
                                case .daily:
                                    Text("Day \(i + 1)")
                                case .weekly:
                                    Text(weekday_names[i])
                                }
                            } 
                            .foregroundStyle(focused_day.id == ordered_days[i].id ? .blue : .gray)
                            .fontWeight(focused_day.id == ordered_days[i].id ? .bold : .regular)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .padding(.horizontal)
            
            HStack {
                Text(focused_day.name)
                    .font(.title3)
                    .bold()
                
                Spacer()
                
                NavigationLink(destination: ProgramExerciseAdderView(day: focused_day)) {
                    Text("Add Exercises")
                }
            }
            .padding(.horizontal)
            
            Group {
                if focused_day.exercises.isEmpty {
                    VStack {
                        Spacer()
                        
                        Text("No exercises have been added to this day.")
                            .font(.title3)
                        Image(systemName: "dumbbell")
                            .foregroundStyle(.red)
                        
                        Spacer()
                    }
                } else {
                    List {
                        ForEach(ordered_exercises, id: \.self) { exercise in
                            Text(exercise.name)
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle(program.name)
            .sheet(isPresented: $change_day_name) {
                NavigationStack {
                    Form {
                        Section(footer: Text("This will overide the name of \(focused_day.name)")) {
                            TextField("New name", text: $new_day_name)
                        }
                    }
                    .navigationTitle("Edit day name")
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Button {
                                change_day_name.toggle()
                            } label: {
                                Text("Cancel")
                                    .foregroundStyle(.red)
                            }
                        }
                        
                        ToolbarItem(placement: .topBarTrailing) {
                            Button {
                                focused_day.name = new_day_name
                                new_day_name = ""
                                change_day_name.toggle()
                            } label: {
                                Text("Save")
                                    .foregroundStyle(.blue)
                            }
                        }
                    }
                }
                .presentationDetents([.medium])
            }
            .sheet(isPresented: $add_new_day) {
                NavigationStack {
                    Form {
                        Section(footer: Text("Name this new day.")) {
                            TextField("Name", text: $new_day_name)
                        }
                    }
                    .navigationTitle("New Day")
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Button {
                                add_new_day.toggle()
                            } label: {
                               Text("Cancel")
                                    .foregroundStyle(.red)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        
                        ToolbarItem(placement: .topBarTrailing) {
                            Button {
                                if new_day_name != "" {
                                    program.program_days.append(ProgramDay(name: new_day_name, index: program.program_days.count))
                                }
                                add_new_day.toggle()
                                new_day_name = ""
                            } label: {
                               Text("Add")
                                    .foregroundStyle(.blue)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
                .presentationDetents([.medium])
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        NavigationLink(destination: ProgramSettingsView(program: program)) {
                            HStack {
                                Text("Program settings")
                                Image(systemName: "gear")
                            }
                        }
                        
                        Button {
                            
                        } label: {
                            Text("Change order of exercises")
                            Image(systemName: "list.bullet")
                        }
                        
                        Button {
                            change_day_name.toggle()
                        } label: {
                            Text("Edit day name")
                            Image(systemName: "pencil")
                        }
                        
                        NavigationLink(destination: ChangeExerciseOrderView(day: focused_day, buffer: build_buffer(day: ordered_exercises))) {
                            Text("Change order of exercises")
                            Image(systemName: "list.clipboard")
                        }
                        
                        if program.type == .daily {
                            Button {
                                add_new_day.toggle()
                            } label: {
                                Text("Add new day")
                                Image(systemName: "plus")
                            }
                        }
                    } label: {
                        Image(systemName: "gear")
                    }
                }
            }
        }
    }
}

//#Preview {
//    ProgramInspectorView()
//}
