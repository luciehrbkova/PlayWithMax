//
//  TopViewModel.swift
//  PlayWithMax 1.0
//
//  Created by Lucie Hrbkova on 15/09/2024.
//

import Foundation
import SwiftUI

class TopViewModel: ObservableObject {
    var categories: [Category] = [
        Category(name: "Farm Animals", 
                 backgroundImage: "farm1",
                 color: .teal, 
                 items: ["pig", "cow", "sheep", "goat", "horse", "donkey", "cat", "dog", "rabbit", "chicken", "duck"]),
        Category(name: "Jungle Animals", 
                 backgroundImage: "jungle",
                 color: .indigo,
                 items: ["tiger", "monkey", "giraffe", "elephant", "lion", "crocodile", "snake", "panda", "zebra", "antelope"]),
        Category(name: "Vehicles",
                 backgroundImage: "city2",
                 color: .purple,
                 items: ["bus", "boat", "ballon", "taxi", "plane", "truck", "police", "fireengine", "ambulance", "bagr"]),
    ]
}

struct Category: Hashable, Equatable {
    let name: String
    let backgroundImage: String
    let color: Color
    let items: [String]

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(backgroundImage)
        hasher.combine(color)
    }

    static func == (lhs: Category, rhs: Category) -> Bool {
        return lhs.name == rhs.name && lhs.backgroundImage == rhs.backgroundImage && lhs.color == rhs.color
    }
}
