//
//  CardGameView.swift
//  PlayWithMax 1.0
//
//  Created by Lucie Hrbkova on 13/09/2024.
//

import SwiftUI

struct CardGameView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @State private var tappedAnimal: String?
    @ObservedObject private var audioPlayer = AudioPlayer() // Instantiate audio player
    @ObservedObject private var viewModel = CardViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CardGameView()
}
