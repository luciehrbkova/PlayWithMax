//
//  GuessGameView.swift
//  PlayWithMax 1.0
//
//  Created by Lucie Hrbkova on 26/07/2024.
//

import SwiftUI

struct GuessGameView: View {
    @ObservedObject private var viewModel = FarmAnimalsViewModel()
    
    var body: some View {
        
        VStack {
            Text("Guess Farm Animal")
            VStack {
                FlipCardView(viewModel: viewModel, 
                             sfSymbol: Image(systemName: "music.quarternote.3"))
                    .onTapGesture {
                        if viewModel.isFlipped {
                            viewModel.restartGame()
                        }
                    }
                HStack
                {
                    ForEach(0..<2) { index in
                        choiceButton(animal: viewModel.getAnimal(index: index).image,
                                     number: index)
                    }

                }
                .padding(.top, 100)

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Allow the view to expand to fill the screen
           .background(
               Image("farm1")
                   .resizable()
                   .scaledToFill()
                   .clipped()
           )
           .edgesIgnoringSafeArea(.all) // Optional to ensure it respects safe area
           .padding(.horizontal, 50)
        }
        .navigationBarTitleDisplayMode(.inline)
        
        
    }
    
    func choiceButton(animal: Image, number: Int) -> some View {
        Button {
            viewModel.choiceButtonTapped(number: number)
//            isFlipped.toggle()
        } label: {
            animal
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding(12)
        }
        .contentShape(Rectangle()) // Entire frame is tappable
        .background(.white)
        .cornerRadius(20)
        .shadow(radius: 5)
    }

}

#Preview {
    GuessGameView()
}
