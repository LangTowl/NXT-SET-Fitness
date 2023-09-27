//
//  AccountInspectorView.swift
//  NXT SET
//
//  Created by Lang Towl on 9/26/23.
//

import SwiftUI
import SwiftData

struct AccountInspectorView: View {
    
    // Model context instantiation
    @Environment(\.modelContext) private var model_context
    
    // Enviromental variables
    @Environment(\.dismiss) var dismiss_new_user_inspector_view
    
    // Passed paremeters
    @Bindable var user: User
    var user_list: [User]
    
    var body: some View {
        NavigationStack {
            Form {
                Section(footer: Text("Changer your name.")) {
                    TextField("\(user.name)", text: $user.name)
                        .autocapitalization(.none)
                }
                
                Section(footer: Text("Changer your email.")) {
                    TextField("\(user.email)", text: $user.email)
                        .autocapitalization(.none)
                }
                
                Section(footer: Text("Change your password.")) {
                    NavigationLink(destination: Text("Erm...")) {
                        Text("Change password")
                    }
                }
                
                Section(footer: Text("Will set all other accounts as inactive.")) {
                    Button {
                        user.signed_in.toggle()
                        verify_active_user(user: user, user_list: user_list)
                    } label: {
                        switch user.signed_in {
                        case true:
                            Text("Deactiate user")
                                .foregroundStyle(.red)
                        case false:
                            Text("Actiate user")
                                .foregroundStyle(.green)
                        }
                    }
                }
                
                Section(footer: Text("This action is not reversible.")) {
                    Button {
                        model_context.delete(user)
                        dismiss_new_user_inspector_view()
                    } label: {
                        Text("Delete this user")
                            .foregroundStyle(.red)
                            .bold()
                    }
                }
            }
            .navigationTitle("Edit User")
        }
    }
}

//#Preview {
//    AccountInspectorView()
//}
