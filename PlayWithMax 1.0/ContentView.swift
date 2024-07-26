//
//  ContentView.swift
//  PlayWithMax 1.0
//
//  Created by Lucie Hrbkova on 25/07/2024.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @State private var tappedAnimal: String?
    @ObservedObject private var audioPlayer = AudioPlayer() // Instantiate audio player
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            ScrollView(.horizontal) {
                
                HStack{
                    ForEach(animals, id: \.name) { animal in
                        AnimalCard(animal: animal.image, isTapped: tappedAnimal == animal.name, backGround: colors.randomElement() ?? .white)
                            .onTapGesture {
                                audioPlayer.playSound(mp3: animal.name)
                                withAnimation {
                                    tappedAnimal = tappedAnimal == animal.name ? nil : animal.name
                                }
                                print(animal.name)
                            }
                    }
                    
                }
                .padding()
                .scrollTargetLayout()
            }
            .contentMargins(16, for: .scrollContent)
            .scrollTargetBehavior(.viewAligned)
        }
    }
    
    func AnimalCard(animal: String, isTapped: Bool, backGround: Color) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(LinearGradient(gradient: Gradient(colors: [ .white, backGround]), startPoint: .top, endPoint: .bottomTrailing))
//                .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 0)
                .shadow(color: isTapped ? .clear : .black.opacity(0.5), radius: isTapped ? 0 : 10, x: 0, y: 0) // Remove shadow when tapped
                .frame(minWidth: 250, maxHeight: 400)
                .padding()
            Text(animal)
                .font(.system(size: 180))
        }
        .scrollTransition { EmptyVisualEffect, phase in
            EmptyVisualEffect
                .opacity(phase.isIdentity ? 1.0 : 0.5)
                .scaleEffect(x: phase.isIdentity ? 1.0 : 0.8,
                             y: phase.isIdentity ? 1.0 : 0.8)
        }
    }
}


#Preview {
    ContentView()
}
