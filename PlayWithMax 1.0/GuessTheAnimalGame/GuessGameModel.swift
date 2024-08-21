//
//  GuessGameModel.swift
//  PlayWithMax 1.0
//
//  Created by Lucie Hrbkova on 12/08/2024.
//

import SwiftUI
import Combine

class GuessGameModel: ObservableObject {
    private var viewModel = FarmAnimalsViewModel() // Presuming this instance is correct

    // Make the animals property an @Published property for observable updates
    @State var animals: [AnimalImageObject] // Adjust type based on what animalImageSet holds

    init() {
        // Initialize the animals property with the data from viewModel
        self.animals = viewModel.animalImageSet // Use the correct property here
    }
    
    func gameRound() {
        //1. Shuffle set
       var shuffledSet = animals.shuffled()
       var correctAnswer = Int.random(in: 0...1)
        
    }
    
}

