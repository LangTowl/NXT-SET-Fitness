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
                    EmptyView()
                } else {
                    ScrollView {
                        Text(user[0].name)
                    }
                }
            }
            .navigationTitle("Programs")
        }
    }
}

#Preview {
    ProgramView()
}
