//
//  PrimaryMuscles.swift
//  NXT SET Fitness
//
//  Created by Lang Towl on 7/23/23.
//

import Foundation

enum PrimaryMuscle: String, Codable {
    case chest
    case back
    case shoulder
    case tricep
    case bicep
    case forearm
    case core
    case quad
    case hamstring
    case glute
    case calve
    case other
    case empty
}

let primary_muscles: [PrimaryMuscle] = [.chest, .back, .shoulder, .tricep, .bicep, .forearm, .core, .quad, .hamstring, .glute, .calve, .other]
