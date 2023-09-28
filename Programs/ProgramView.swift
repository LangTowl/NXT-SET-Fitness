//
//  ProgramView.swift
//  NXT SET
//
//  Created by Lang Towl on 9/26/23.
//

import SwiftUI
import SwiftData

struct ProgramView: View {
    
    // Model context instantiation
    @Environment(\.modelContext) private var model_context
    @Query(filter: #Predicate<User> {$0.signed_in == true }) var user: [User]
    
    var body: some View {
        NavigationStack {
            Group {
                if user.isEmpty {
                    VStack {
                        Spacer()
                        Text("No active users detected")
                            .font(.title2)
                        Image(systemName: "person")
                            .font(.title3)
                            .foregroundStyle(.red)
                        Spacer()
                    }
                } else {
                    List {
                        ForEach(user[0].programs) { program in
                            NavigationLink(destination: ProgramInspectorView(program: program)) {
                                HStack {
                                    Text(program.name)
                                    
                                    Spacer()
                                    
                                    Image(systemName: program.activate_program == true ? "dumbbell.fill" : "dumbbell")
                                        .foregroundStyle(program.activate_program == true ? .green : .red)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Programs")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    if user.isEmpty {
                        Image(systemName: "plus")
                            .foregroundColor(.gray)
                    } else {
                        NavigationLink(destination: NewProgramView(user: user[0])) {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ProgramView()
}
