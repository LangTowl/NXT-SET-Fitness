//
//  CardioType.swift
//  NXT SET Beta 5
//
//  Created by Lang Towl on 8/7/23.
//

import Foundation

enum CardioType: String, Codable, CaseIterable {
    case running
    case walking
    case swimming
    case cycling
    case rowing
    case stairs
    case other
}
