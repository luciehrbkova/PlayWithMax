//
//  FarmAnimalsViewModel.swift
//  PlayWithMax 1.0
//
//  Created by Lucie Hrbkova on 01/08/2024.
//

import Foundation
import SwiftUI

class FarmAnimalsViewModel : ObservableObject {
    
    private var animals: [AnimalImageObject] = [] // Store the array of animals
    
    init(animals: [AnimalImageObject] = []){
        populateAnimalImageSet()
        self.animals = animalImageSet
    }
    
    
    // Removed global variable and made it a property in the class
    private(set) var animalImageSet: [AnimalImageObject] = []
    
    func populateAnimalImageSet() {
        let animalList = ["cat", "dog", "sheep", "donkey", "goat", "rabbit", "chicken", "duck", "cow", "pig", "horse"]
        animalImageSet = animalList.map { animal in
            createAnimalObject(animal: animal)
        }
        self.animals = animalImageSet // Set the animals property after populating
    }

    func createAnimalObject(animal: String) -> AnimalImageObject {
        let animalImage = Image(animal) // Assumes you have images in your assets
        return AnimalImageObject(name: animal, image: animalImage)
    }
    
    // Optionally, you can expose animals for reading
        var allAnimals: [AnimalImageObject] {
            return animals
        }
}

struct AnimalImageObject {
    let name: String
    let image: Image
}
