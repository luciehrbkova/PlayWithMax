//
//  FarmAnimaEmojiCardView.swift
//  PlayWithMax 1.0
//
//  Created by Lucie Hrbkova on 01/08/2024.
//

import SwiftUI
import AVFoundation

struct FarmAnimaEmojiCardView: View {
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @State private var tappedAnimal: String?
    @ObservedObject private var audioPlayer = AudioPlayer() // Instantiate audio player
    
    var body: some View {
        ZStack {
            ScrollView(.horizontal) {
                HStack{
                    ForEach(animalsEmojiSet, id: \.name) { animal in
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
            .scrollIndicators(.hidden)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Allow the view to expand to fill the screen
               .background(
                   Image("farm1")
                       .resizable()
                       .scaledToFill()
                       .clipped()
               )
               .edgesIgnoringSafeArea(.all) // Optional to ensure it respects safe area
    }
    
    func AnimalCard(animal: String, isTapped: Bool, backGround: Color) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(LinearGradient(gradient: Gradient(colors: [ .white, backGround]), startPoint: .top, endPoint: .bottomTrailing))
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
    FarmAnimaEmojiCardView()
}
