//
//  TabMenuView.swift
//  PlayWithMax 1.0
//
//  Created by Lucie Hrbkova on 28/08/2024.
//

import SwiftUI

struct CategoryTabView: View {
    @State private var selectedTab: Int = 0
    
    var category: Category
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        TabView (selection: $selectedTab) {
            CarouselCardView(category: category, selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "square.3.layers.3d.down.left")
                    Text("Voices")
                }
                .tag(0)
            CardGameView(category: category, selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "questionmark.diamond")
                    Text("Guess Game")
                }
                .tag(1)
        }
        .onAppear() {
            UITabBar.appearance().backgroundColor = .systemBackground
        }
        .accentColor(ColorPalette.forestGreen)
        .navigationTitle(category.name)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            // Customize the back button's appearance
           ToolbarItem(placement: .navigationBarLeading) {
               Button(action: {
                   presentationMode.wrappedValue.dismiss()
               }) {
                   HStack {
                       Image(systemName: "chevron.backward") // Custom back icon
//                       Text("Back")
                   }
               }
           }
           
    // TODO: add pdf generator/
           // Add a custom button to the top right corner
           ToolbarItem(placement: .navigationBarTrailing) {
               Button(action: {
                 // Load the PDF document
                   if let pdfURL = Bundle.main.url(forResource: category.name, withExtension: "pdf") {
                     // Choose between share and print options
                     presentShareOrPrintOptions(pdfURL: pdfURL)
                 } else {
                     print("PDF document not found.")
                 }
             }) {
                 Image(systemName: "printer")
             }
           }
        }
    }
    
    // Helper function to present share and print options
    func presentShareOrPrintOptions(pdfURL: URL) {
        let activityViewController = UIActivityViewController(activityItems: [pdfURL], applicationActivities: nil)

        // Present the activity view controller for sharing
        if let topController = UIApplication.shared.windows.first?.rootViewController {
            topController.present(activityViewController, animated: true, completion: nil)
        }

        // Print functionality can be separate or incorporated into the share sheet as well.
        if UIPrintInteractionController.isPrintingAvailable {
            let printController = UIPrintInteractionController.shared
            printController.printingItem = pdfURL
            printController.present(animated: true, completionHandler: nil)
        }
    }
}
