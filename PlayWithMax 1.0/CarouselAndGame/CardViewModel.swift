//
//  CardViewModel.swift
//  PlayWithMax 1.0
//
//  Created by Lucie Hrbkova on 13/09/2024.
//

import Foundation
import SwiftUI

class CardViewModel: ObservableObject {
    
    @Published var animals: [CardImageObject] // Store the array of animals
    @Published var correctAnswer: Int
    @Published var isFlipped = false
    @Published var animate = false
    @Published var cardBackgroundColor: Color = .white
    @ObservedObject private var audioPlayer = AudioPlayer() // Instantiate audio player
    private let delay: Double = 0.3
    
    init() {
        self.animals = CardImageObject.DefaultImageSet()
        self.correctAnswer = Int.random(in: 0...1)
        restartGame(delay: delay) // No need for any delay on the first run
    }
    
    func restartGame(delay: Double = 0.3) {
        // Reset the flipped state first
        isFlipped = false
        animate = false
        // We need a 0.3 second delay until we switch to the next correct answer
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.correctAnswer = Int.random(in: 0...1) // Randomly select the correct answer
            self.animals.shuffle() // Shuffle the animals
        }
    }

    func getAnimal(index: Int) -> CardImageObject {
        animals[index]
    }

    func getCorrectAnimal() -> CardImageObject {
        getAnimal(index: correctAnswer)
    }

    func choiceButtonTapped(number: Int) {
        if (number == correctAnswer){
            isFlipped = true
            DispatchQueue.main.asyncAfter(deadline: .now()){
                self.playCorrectAnimal()
            }
        } else {
            changeBackgroundColor()
            print("Wrong answer")
        }
    }
    
    func changeBackgroundColor() {
        cardBackgroundColor = (.red)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.cardBackgroundColor = .white
        }
    }
    
    func mainCardTapped() {
        if !isFlipped {
            playCorrectAnimal()
            animate.toggle()
        } else {
            restartGame()
        }
    }
    
    func playCorrectAnimal() {
        audioPlayer.playSound(mp3: animals[correctAnswer].name)
    }
    
}

struct CardImageObject {
    init(name: String) {
            self.name = name
            self.image = Image(name)
        }
    let name: String
    let image: Image
    
    static func DefaultImageSet() -> [CardImageObject] {
            ["pig", "cow", "sheep", "goat", "horse", "donkey", "cat", "dog", "rabbit", "chicken", "duck"]
                .map { CardImageObject(name: $0) }
        }
}

