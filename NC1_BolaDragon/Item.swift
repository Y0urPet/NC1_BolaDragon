//
//  Item.swift
//  NC1_BolaDragon
//
//  Created by Timothy Andrian on 25/04/24.
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
