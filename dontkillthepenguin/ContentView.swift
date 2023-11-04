//
//  ContentView.swift
//  dontkillthepenguin
//
//  Created by not Michael Chen on 11/4/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        Background()
    }
}

struct Background: View {
    var body: some View {
        VStack{
            Image("arctic background1")
                .scaleEffect(1.25)
                .overlay(ViewDisplay())
        }
    }
}

struct StreakText: View {
    @State private var streakCounter = 0
    var body: some View {
        VStack{
            Text("\(streakCounter)")
                .padding(10)
        }
    }
}

// struct GreetingText: View {
//     var body: some View {
//         VStack{
//             Text("Welcome!")
//                 .padding(10)
//         }
//     }
// }


struct ViewDisplay: View {
    @State private var penguinHealth = 100
    @State private var isPopoverVisible = false
    @State private var goalHours = 2.0
    @State private var currHours = 2.0
    
    var body: some View {
        
        VStack {
            
            // Streak Counter in the Top Right Corner
            Spacer()
            HStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(red: 191 / 255, green: 185 / 255, blue: 255 / 255, opacity: 0.7))
                    .frame(width: 200, height: 80)
                    .padding(10)
                    .overlay(HStack {
                        VStack(alignment: .leading){
                                        Text("Goal time: ").fontWeight(.bold) + Text("\(goalHours, specifier: "%.0f")").font(Font.system(size: 25)) + Text(" hr")
                
                                        Text("Screen time: ").fontWeight(.bold) + Text("\(currHours, specifier: "%.0f")").font(Font.system(size: 25)) + Text(" hr")
                                    }
                            })
                Spacer()
                Image("streak")
                    .padding(10)
                    .overlay(StreakText())
            }
            Spacer()
                .frame(height:300)
            
            // Penguin Image
            let imageName = penguinImageName(for: penguinHealth)
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .padding()
            
            ProgressBar(value: $penguinHealth)
                .frame(height: 20)
                .padding(.horizontal, 100)
            
            Spacer()
                .frame(height: 30)
            Button(action: { isPopoverVisible.toggle() // Code to add goals
                }) {
                    Text("Add Goals!")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .popover(isPresented: $isPopoverVisible, content: {
                    VStack {
                        Text("Set Goal Hours")
                            .font(.headline)
                            .padding()
                        Slider(value: $goalHours, in: currHours...24, step: 1)
                            .padding()
                        Text("Goal: \(Int(goalHours)) hours")
                            .padding()
                        Button("Save Goal") {
                            // Handle saving the selected goal
                            isPopoverVisible.toggle()
                        }
                        .padding()
                    }
                    .frame(width: 200, height: 200)
                })
                Spacer()
            }
            .padding(20)
        }
    }

            
private func penguinImageName(for penguinHealth: Int) -> String {
            // Determine the penguin image based on penguinHealth
            // (You can customize this logic as needed)
            if penguinHealth <= 0 {
                return "deadpenguincoffin"
            }
            else if penguinHealth < 20{
                return "sickpenguin"
            }
            else if penguinHealth < 40 {
                return "depressedpenguin"
            }
            else if penguinHealth < 60 {
                return "sadpenguin"
            }
            else if penguinHealth < 80 {
                return "penguin"
            }
            else {
                return "drippypenguin"
            }
        }

        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
            }
        }
//#Preview {
//    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
//}
