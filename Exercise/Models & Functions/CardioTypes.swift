//
//  CardioTypes.swift
//  NXT SET Fitness
//
//  Created by Lang Towl on 7/23/23.
//

import Foundation

enum CardioType: String, Codable {
    case walking
    case running
    case swimming
    case cycling
    case rowing
    case stairs
    case other
    case empty
}

let cardio_types: [CardioType] = [.walking, .running, .swimming, .cycling, .rowing, .stairs, .other]
