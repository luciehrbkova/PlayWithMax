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
        Category(name: "Farm Animals", imageName: "farm1", color: .teal, destinationView: AnyView(CategoryTabView())),
        Category(name: "Jungle Animals", imageName: "farm2", color: .indigo, destinationView: AnyView(CategoryTabView())),
        Category(name: "Vehicles", imageName: "farm1", color: .purple, destinationView: AnyView(CategoryTabView())),
        
    ]
}

struct Category: Hashable, Equatable {
    let name: String
    let imageName: String
    let color: Color
    let destinationView: AnyView

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(imageName)
        hasher.combine(color)
    }

    static func == (lhs: Category, rhs: Category) -> Bool {
        return lhs.name == rhs.name && lhs.imageName == rhs.imageName && lhs.color == rhs.color
    }
}
