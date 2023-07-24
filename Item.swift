//
//  Item.swift
//  NXT SET Fitness
//
//  Created by Lang Towl on 7/22/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
