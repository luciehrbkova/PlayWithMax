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
        Category(name: "Farm Animals", backgroundImage: "farm1", color: .teal),
        Category(name: "Jungle Animals", backgroundImage: "farm2", color: .indigo),
        Category(name: "Vehicles", backgroundImage: "farm1", color: .purple),
        
    ]
}

struct Category: Hashable, Equatable {
    let name: String
    let backgroundImage: String
    let color: Color

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(backgroundImage)
        hasher.combine(color)
    }

    static func == (lhs: Category, rhs: Category) -> Bool {
        return lhs.name == rhs.name && lhs.backgroundImage == rhs.backgroundImage && lhs.color == rhs.color
    }
}
