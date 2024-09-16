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
                 backgroundImage: "farm2",
                 color: .indigo,
                 items: ["cat", "dog", "rabbit"]),
        Category(name: "Vehicles",
                 backgroundImage: "farm1",
                 color: .purple,
                 items: ["goat", "horse", "donkey"]),
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
