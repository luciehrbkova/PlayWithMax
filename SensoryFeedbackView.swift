//
//  SensoryFeedbackView.swift
//  PlayWithMax 1.0
//
//  Created by Lucie Hrbkova on 08/08/2024.
//

import SwiftUI

struct SensoryFeedbackView: View {
    @State private var taskIsComplete = false

    var body: some View {
        Button("Mark Complete") {
            taskIsComplete = true
        }
        .sensoryFeedback(.success, trigger: taskIsComplete)
    }
}

#Preview {
    SensoryFeedbackView()
}
