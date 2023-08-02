//
//  ProgramInspectorView.swift
//  NXT SET Fitness
//
//  Created by Lang Towl on 8/1/23.
//

import SwiftUI
import SwiftData

struct ProgramInspectorView: View {
    
    @Environment(\.modelContext) private var model_context
    @Environment(\.dismiss) var dismiss_program_inspector
    
    @Bindable var program: Program
    
    var ordered_days: [ProgramDay] {
        program.program_days.sorted(by: { $0.position < $1.position })
    }
    
    @State var focus: Int = 0
    @State var edit_program_day_popover: Bool = false
    
    @State var temp_name: String = ""
    
    var body: some View {
        
        ScrollView(.horizontal) {
            HStack(spacing: 15) {
                ForEach(0...(program.program_days.count - 1), id: \.self) { i in
                    Button {
                        focus = i
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: program_day_button_radius)
                                .foregroundStyle(Color("pink_leading"))
                                .opacity(focus == i ? 1.0 : 0.5)
                            
                            switch program.type {
                            case "daily":
                                Text(String(i + 1))
                                    .bold()
                            case "weekly":
                                Text(weeklky_program_ids[i])
                                    .bold()
                            default:
                                EmptyView()
                            }
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                
                if program.type == "daily" {
                    Button {
                        program.program_days.append(ProgramDay(name: "", position: ordered_days.count))
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: program_day_button_radius)
                                .foregroundStyle(Color("pink_leading"))
                                .opacity(0.5)
                            
                            Image(systemName: "plus")
                                .foregroundStyle(.white)
                                .font(.title3).bold()
                        }
                    }
                }
            }
        }
        .scrollPosition(initialAnchor: .leading)
        .scrollIndicators(.hidden)
        .padding(.horizontal)
        
        NavigationStack {
            ScrollView {
                HStack {
                    Text(ordered_days[focus].name == "" ? "No name" : ordered_days[focus].name)
                        .font(.title).bold()
                    
                    Spacer()
                    
                    Button {
                        edit_program_day_popover.toggle()
                    } label: {
                        Text("edit")
                            .foregroundStyle(Color("blue_trailing"))
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                
                Divider()
            }
            .padding(.horizontal)
            .navigationTitle(program.name)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss_program_inspector()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.white)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .sheet(isPresented: $edit_program_day_popover) {
                NavigationStack {
                    Form {
                        Section(footer: Text("Choose a new name for this program day.")) {
                            TextField("Name", text: $temp_name)
                        }
                        
                        if program.type == "daily" {
                            Section(footer: Text("This action cannon be undone.")) {
                                Button {
                                    if program.program_days.count > 1 {
                                        program.program_days.remove(at: focus)
                                        try? model_context.save()
                                        focus = 0
                                        edit_program_day_popover.toggle()
                                    }
                                } label: {
                                    HStack {
                                        Text("Delete this program day")
                                            .foregroundStyle(Color("pink_leading"))
                                            .bold()
                                        
                                        Spacer()
                                    }
                                }
                            }
                        }
                        
                        Section(footer: Text("This day will be designated as an of day with no scheduled events or training session.")) {
                            
                            Button {
                                edit_program_day_popover.toggle()
                            } label: {
                                HStack {
                                    Text("Mark this day as a rest day")
                                        .foregroundStyle(Color("blue_trailing"))
                                        .bold()
                                    
                                    Spacer()
                                }
                            }
                        }
                    }
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Button {
                                edit_program_day_popover.toggle()
                            } label: {
                                Text("Cancel")
                                    .foregroundStyle(Color("pink_leading"))
                            }
                        }
                        
                        ToolbarItem(placement: .topBarTrailing) {
                            Button {
                                ordered_days[focus].name = temp_name
                                temp_name = ""
                                edit_program_day_popover.toggle()
                            } label: {
                                Text("Done")
                                    .foregroundStyle(Color("blue_trailing"))
                                    .bold()
                            }
                        }
                    }
                }
                .presentationDetents([.medium])
                .presentationBackground(.ultraThinMaterial)
                .environment(\.colorScheme, .dark)
            }
        }
        .environment(\.colorScheme, .dark)
    }
}
