//
//  ImageView.swift
//  PlayWithMax 1.0
//
//  Created by Lucie Hrbkova on 29/07/2024.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        ZStack{
            Image(.farm1)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        }
 
    }
}






#Preview {
    ImageView()
}
