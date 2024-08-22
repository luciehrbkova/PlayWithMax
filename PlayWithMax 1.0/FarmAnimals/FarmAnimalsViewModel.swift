//
//  FarmAnimalsViewModel.swift
//  PlayWithMax 1.0
//
//  Created by Lucie Hrbkova on 01/08/2024.
//

import Foundation
import SwiftUI

class FarmAnimalsViewModel: ObservableObject  {
    
    @Published var animals: [AnimalImageObject] // Store the array of animals
    @Published var correctAnswer: Int
    @Published var isFlipped = false
    @Published var animate = false
    @Published var cardBackgroundColor: Color = .white
    @ObservedObject private var audioPlayer = AudioPlayer() // Instantiate audio player
    
    init() {
        self.animals = AnimalImageObject.DefaultAnimalSet()
        self.correctAnswer = Int.random(in: 0...1)
        restartGame(delay: 0) // No need for any delay on the first run
    }
    
    func restartGame(delay: Double = 0.3) {
        // Reset the flipped state first
        isFlipped = false
        animate = false
        // We need a 0.3 second delay until we switch to the next correct answer,
        // because otherwise you can see it when the card flips back around!
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.correctAnswer = Int.random(in: 0...1) // Randomly select the correct answer
            self.animals.shuffle() // Shuffle the animals
        }
    }

    func getAnimal(index: Int) -> AnimalImageObject {
        animals[index]
    }

    func getCorrectAnimal() -> AnimalImageObject {
        getAnimal(index: correctAnswer)
    }

    func choiceButtonTapped(number: Int) {
        if (number == correctAnswer){
            isFlipped = true
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
            audioPlayer.playSound(mp3: animals[correctAnswer].name)
            animate.toggle()
        } else {
            restartGame()
        }
    }
    
    
}

struct AnimalImageObject {
    init(name: String) {
            self.name = name
            self.image = Image(name)
        }

        let name: String
        let image: Image
    
    static func DefaultAnimalSet() -> [AnimalImageObject] {
            ["pig", "cow", "sheep", "goat", "horse", "donkey","cat", "dog", "rabbit", "chicken", "duck"]
                .map { AnimalImageObject(name: $0) }
        }
}
