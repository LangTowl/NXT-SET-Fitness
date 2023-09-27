//
//  UserFunctions.swift
//  NXT SET
//
//  Created by Lang Towl on 9/26/23.
//

import Foundation
import SwiftData

func verify_active_user(user: User, user_list: [User]) {
    for i in 0...(user_list.count - 1) {
        if user_list[i].id != user.id {
            user_list[i].signed_in = false
        }
    }
}
