//
//  MainMenuView.swift
//  PlayWithMax 1.0
//
//  Created by Lucie Hrbkova on 01/08/2024.
//

import SwiftUI

var topics: [Topic] = [
    Topic(name: "Farm Emojis", imageName: "hare", color: .green, destinationView: AnyView(FarmAnimaEmojiCardView())),
    Topic(name: "Farm Animals", imageName: "cat", color: .teal, destinationView: AnyView(FarmAnimalsCardView())),
    Topic(name: "Farm Guess Game", imageName: "pawprint", color: .indigo, destinationView: AnyView(GuessGameView())),
]

struct MainMenuView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Games")) {
                    ForEach(topics, id: \.name) { topic in
                        NavigationLink(destination: topic.destinationView) {
                            Label(topic.name, systemImage: topic.imageName)
                                .foregroundColor(topic.color)
                        }
                    }
                }
            }
            .navigationTitle("Play with Max")
        }
    }
}

struct Topic: Hashable, Equatable {
    let name: String
    let imageName: String
    let color: Color
    let destinationView: AnyView

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(imageName)
        hasher.combine(color)
    }

    static func == (lhs: Topic, rhs: Topic) -> Bool {
        return lhs.name == rhs.name && lhs.imageName == rhs.imageName && lhs.color == rhs.color
    }
}

#Preview {
    MainMenuView()
}
