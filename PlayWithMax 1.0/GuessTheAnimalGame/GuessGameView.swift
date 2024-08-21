//
//  GuessGameView.swift
//  PlayWithMax 1.0
//
//  Created by Lucie Hrbkova on 26/07/2024.
//

import SwiftUI

struct GuessGameView: View {
    @State var isFlipped = false
    @ObservedObject private var viewModel = FarmAnimalsViewModel()
    
    @State private var animals: [AnimalImageObject] = [] // Changed to hold the shuffled array
    @State private var correctAnswer = Int.random(in: 0...1)
    
//    init(animals: [AnimalImageObject] = []){
//        self.animals = viewModel.shuffleAnimals()
//    }
//    init(){
//        
//    }
    
    var body: some View {
//        @State var animals = viewModel.animalImageSet.shuffled()
        
        VStack {
            Text("Guess Farm Animal")
            VStack {
                FlipCardView(isFlipped: $isFlipped, animalImage: animals[correctAnswer].image, sfSymbol: Image(systemName: "music.quarternote.3"))
                    .onTapGesture {
                        if isFlipped {
                        restartGame()
                        }
                    }
                HStack
                {
                    ForEach(0..<2) { index in
                        choiceButton(animal: animals[index].image, number: index)
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
        .onAppear(perform: setupGame)
        
    }
    
    func choiceButton(animal: Image, number: Int) -> some View {
        Button {
            choiceButtonTapped(number: number)
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
    
    func choiceButtonTapped(number: Int) {
        if (number == correctAnswer){
            isFlipped = true
        } else {
            print("Wrong answer")
        }
    }
    
    private func setupGame() {
        animals = viewModel.animalImageSet.shuffled() // Shuffle the animals
        correctAnswer = Int.random(in: 0..<2) // Randomly select the correct answer
        isFlipped = false // Reset flipped state
    }
    
    func restartGame() {
        setupGame()
        print(correctAnswer)
    }

}

#Preview {
    GuessGameView()
}
