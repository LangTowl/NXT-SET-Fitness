//
//  AccountView.swift
//  NXT SET
//
//  Created by Lang Towl on 9/26/23.
//

import SwiftUI
import SwiftData

struct AccountView: View {
    
    // Model context instantiation
    @Environment(\.modelContext) private var model_context
    @Query private var users: [User]
    
    var body: some View {
        NavigationStack {
            List {
                if users.isEmpty {
                    EmptyView()
                } else {
                    ForEach(users) { user in
                        NavigationLink(destination: AccountInspectorView(user: user, user_list: users)) {
                            HStack {
                                Text(user.name)
                                
                                Spacer()
                                
                                Image(systemName: user.signed_in == true ? "person.fill" : "person")
                                    .foregroundStyle(user.signed_in == true ? .green : .red)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .navigationTitle("Accounts")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: NewAccountView()) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    AccountView()
}
