//
//  CarouselCardView.swift
//  PlayWithMax 1.0
//
//  Created by Lucie Hrbkova on 13/09/2024.
//

import SwiftUI

struct CarouselCardView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @State private var tappedImage: String?
    @ObservedObject private var audioPlayer = AudioPlayer() // Instantiate audio player
    @ObservedObject private var viewModel = CardViewModel()
    
    var body: some View {
        VStack {
            ZStack {
                ScrollView(.horizontal) {
                    HStack{
                        ForEach(viewModel.animals, id: \.name) { animal in
                            CardView(animal: animal.image, isTapped: tappedImage == animal.name, backGround: .white)
                                .onTapGesture {
                                    audioPlayer.playSound(mp3: animal.name)
                                    withAnimation {
                                        tappedImage = tappedImage == animal.name ? nil : animal.name
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
            .frame(maxWidth: .infinity, maxHeight: .infinity)
               .background(
                   Image("farm1")
                       .resizable()
                       .scaledToFill()
                       .clipped()
               )
               .edgesIgnoringSafeArea(.all)
        }
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    CarouselCardView()
}
