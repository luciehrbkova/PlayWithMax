//
//  Model.swift
//  PlayWithMax 1.0
//
//  Created by Lucie Hrbkova on 25/07/2024.
//

import Foundation
import SwiftUI

struct AnimalEmoji {
    let name: String
    let image: String
}

let animalsEmojiSet: [AnimalEmoji] = [
    AnimalEmoji(name: "cat", image: "🐈"),
    AnimalEmoji(name: "dog", image: "🦮"),
    AnimalEmoji(name: "sheep", image: "🐑"),
    AnimalEmoji(name: "donkey", image: "🫏"),
    AnimalEmoji(name: "goat", image: "🐐"),
    AnimalEmoji(name: "rabbit", image: "🐇"),
    AnimalEmoji(name: "chicken", image: "🐓"),
    AnimalEmoji(name: "duck", image: "🦆"),
    AnimalEmoji(name: "cow", image: "🐄"),
    AnimalEmoji(name: "pig", image: "🐖"),
    AnimalEmoji(name: "horse", image: "🐎")]

let colors: [Color]
= [.blue, .yellow, .red, .orange, .green, .purple, .pink, .brown, .cyan, .indigo, .mint ]
