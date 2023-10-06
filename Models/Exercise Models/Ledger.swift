//
//  Ledger.swift
//  NXT SET
//
//  Created by Lang Towl on 10/6/23.
//

import Foundation
import SwiftData

struct LedgerItem: Codable {
    var id = UUID()
    var day: UUID
    var exercise: UUID
    var index: Int
}
