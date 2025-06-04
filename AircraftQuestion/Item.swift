//
//  Item.swift
//  AircraftQuestion
//
//  Created by 신동현 on 6/4/25.
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
