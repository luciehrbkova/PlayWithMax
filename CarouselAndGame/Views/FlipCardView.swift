//
//  FlipCardView.swift
//  PlayWithMax 1.0
//
//  Created by Lucie Hrbkova on 06/08/2024.
//

import SwiftUI

struct FlipCardView: View {
       @State private var backDegree = 0.0
       @State private var frontDegree = -90.0
       @ObservedObject var viewModel: CardViewModel
       let sfSymbol: Image

       let width: CGFloat = 200
       let height: CGFloat = 250
    
    var body: some View {
            ZStack {
                CardFront(width: width, height: height, degree: frontDegree, animalImage: viewModel.getCorrectAnimal().image)
                CardBack(width: width, height: height, degree: backDegree, sfSymbol: sfSymbol, animate: viewModel.animate)
            }
            .onChange(of: viewModel.isFlipped) { _ , newValue in // Listen for changes to isFlipped
                flipCard()
            }
        }

    
    private func flipCard() {
            let durationAndDelay: CGFloat = 0.3
            
        if viewModel.isFlipped {
                withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)) {
                    frontDegree = 0
                }
                withAnimation(.linear(duration: durationAndDelay)) {
                    backDegree = 90
                }
            } else {
                withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)) {
                    backDegree = 0
                }
                withAnimation(.linear(duration: durationAndDelay)) {
                    frontDegree = -90
                }
            }
        }
    
}

struct CardFront : View {
    let width : CGFloat
    let height : CGFloat
    var degree : Double
    var animalImage: Image

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .frame(width: width, height: height)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
            animalImage
                .resizable()
                .frame(width: 150, height: 150)
                .foregroundColor(.red)

        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}

struct CardBack : View {
    let width : CGFloat
    let height : CGFloat
    var degree : Double
    var sfSymbol: Image
    var animate: Bool

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .frame(width: width, height: height)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
            sfSymbol
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(.teal)
                .symbolEffect(.bounce, options: .speed(3).repeat(3), value: animate)

        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))

    }
}
