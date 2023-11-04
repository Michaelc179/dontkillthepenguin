//
//  ContentView.swift
//  dontkillthepenguin
//
//  Created by not Michael Chen on 11/4/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var penguinHealth = 100
    @State private var streakCounter = 0

    var body: some View {
        VStack {
            // Streak Counter in the Top Right Corner
            HStack {
                Spacer()
                Text("Streak: \(streakCounter)")
                    .padding(10)
            }
            
            // Penguin Image
            Image(systemName: penguinImageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .padding()
            
            // HP Bar
            ProgressBar(value: $penguinHealth)
                .frame(height: 20)
                .padding(.horizontal, 20)
            
            // Buttons
            HStack {
                Button(action: {
                    // Code to add goals
                }) {
                    Text("Add Goals")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Spacer()
            }
            .padding(20)
        }
            
        private var penguinImageName: String {
            // Determine the penguin image based on penguinHealth
            // (You can customize this logic as needed)
            if penguinHealth <= 0 {
                return "penguin.sad"
            } else if penguinHealth < 50 {
                return "penguin.normal"
            } else {
                return "penguin.happy"
            }
        }
    }

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
