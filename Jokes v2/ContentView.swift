//
//  ContentView.swift
//  Jokes v2
//
//  Created by YJ Soon on 3/2/23.
//

import SwiftUI

struct ContentView: View {
    
    let jokes = [
        Joke(setup: "Why did the scarecrow win an award?", punchline: "Because it was out standing in its field!"),
        Joke(setup: "Why did the chicken cross the road?", punchline: "To get to the other side!"),
        Joke(setup: "Why did the bicycle fall asleep?", punchline: "Because it was two tired!"),
    ]
    
    @State var isPunchlineShown = false
    @State var currentJokeIndex = 0
    @State var isFeedbackPresented = false
    @State var feedbackShown = false
    @State var likedJoke = true
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
            VStack {
                Text(jokes[currentJokeIndex].setup)
                    .padding(.bottom)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                
                Button {
                    isPunchlineShown = true
                } label: {
                    Text("*Tell* me the **answer**!!!!")
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                }
                .padding(40)
                
                if isPunchlineShown {
                    Text(jokes[currentJokeIndex].punchline)
                        .padding(.bottom)
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .multilineTextAlignment(.center)
                    
                    Text("Tap anywhere to continue")
                        .padding()
                        .foregroundColor(.gray)
                        .font(.caption)
                }
            }
            .padding()
        }
        .onTapGesture {
            // when the punchline is shown,
            // we let the user tap to go to the next joke.
            // but then we need to hide the punchline...
            // also we need to not crash the app.
            if isPunchlineShown {
                currentJokeIndex = (currentJokeIndex + 1) % jokes.count
                isPunchlineShown = false
                isFeedbackPresented = true
            }
        }
        .alert("Did you like that joke?", isPresented: $isFeedbackPresented) {
            Button("Yes! I loved it") {
                print(":)")
                feedbackShown = true
                likedJoke = true
            }
            Button("No! I hated it") {
                print(":(")
                feedbackShown = true
                likedJoke = false
            }
        }
        .sheet(isPresented: $feedbackShown) {
            FeedbackView(likedJoke: likedJoke)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
