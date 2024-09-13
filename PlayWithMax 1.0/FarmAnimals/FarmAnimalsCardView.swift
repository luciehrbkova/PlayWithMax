//
//  FarmAnimalsCardView.swift
//  PlayWithMax 1.0
//
//  Created by Lucie Hrbkova on 01/08/2024.
//

import SwiftUI
import AVFoundation

struct FarmAnimalsCardView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @State private var tappedAnimal: String?
    @ObservedObject private var audioPlayer = AudioPlayer() // Instantiate audio player
    @ObservedObject private var viewModel = FarmAnimalsViewModel()

    
    var body: some View {
        
        VStack {
//            Text("Farm Animals")
            ZStack {
                ScrollView(.horizontal) {
                    HStack{
                        ForEach(viewModel.animals, id: \.name) { animal in
                            AnimalCard(animal: animal.image, isTapped: tappedAnimal == animal.name, backGround: .white)
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
                .contentMargins(0, for: .scrollContent)
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
        .navigationBarTitleDisplayMode(.large)
        
    }
 
}

//func AnimalCard(animal: Image, isTapped: Bool, backGround: Color) -> some View {
//    ZStack {
//        RoundedRectangle(cornerRadius: 20)
//            .fill(LinearGradient(gradient: Gradient(colors: [ .white, backGround]), startPoint: .top, endPoint: .bottomTrailing))
//            .shadow(color: isTapped ? .clear : .black.opacity(0.5), radius: isTapped ? 0 : 10, x: 0, y: 0) // Remove shadow when tapped
//            .frame(minWidth: 280, maxHeight: 440)
//            .scaleEffect(x: isTapped ? 1.05 : 1.0,
//                         y: isTapped ? 1.05 : 1.0)
//            .onTapGesture {
//                withAnimation {
//                    isTapped = true // Scale up when tapped
//                }
//
//                // Reset after a 0.5 seconds delay
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                    withAnimation {
//                        isTapped = false // Scale back down after 0.5 seconds
//                    }
//                }
//            }
//            .padding()
//        animal
//            .resizable()
//            .frame(width: 280, height: 280)
//            .scaleEffect(x: isTapped ? 1.05 : 1.0,
//                         y: isTapped ? 1.05 : 1.0)
//    }
//    .scrollTransition { EmptyVisualEffect, phase in
//        EmptyVisualEffect
//            .scaleEffect(x: phase.isIdentity ? 1.0 : 0.9,
//                         y: phase.isIdentity ? 1.0 : 0.9)
//    }
//}

struct AnimalCard: View { // Changed to a View
    var animal: Image
    var isTapped: Bool
    var backGround: Color
    @State private var isAnimating = false // Internal state for animation

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(LinearGradient(gradient: Gradient(colors: [.white, backGround]), startPoint: .top, endPoint: .bottomTrailing))
                .shadow(color: isTapped ? .clear : .black.opacity(0.5), radius: isTapped ? 0 : 10, x: 0, y: 0) // Remove shadow when tapped
                .frame(minWidth: 280, maxHeight: 440)
                .scaleEffect(isAnimating ? 1.05 : 1.0) // Scale effect
                .animation(.easeInOut(duration: 0.3), value: isAnimating) // Animate scale changes
                .onTapGesture {
                    isAnimating = true // Scale up when tapped
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation {
                            isAnimating = false // Scale back down after 0.5 seconds
                        }
                    }
                }
                .padding()

            animal
                .resizable()
                .frame(width: 280, height: 280)
                .scaleEffect(isAnimating ? 1.05 : 1.0) // Scale effect for the animal itself
                .animation(.easeInOut(duration: 0.3), value: isAnimating) // Animate
        }
    }
}

#Preview {
    FarmAnimalsCardView()
}
