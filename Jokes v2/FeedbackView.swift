//
//  FeedbackView.swift
//  Jokes v2
//
//  Created by YJ Soon on 3/2/23.
//

import SwiftUI

struct FeedbackView: View {
    
    var likedJoke: Bool
    
    var body: some View {
        ZStack {
            if likedJoke {
                Color.green
                    .edgesIgnoringSafeArea(.all)
            } else {
                Color.red
                    .edgesIgnoringSafeArea(.all)
            }
            
            Text(likedJoke ? "Thank you! I appreciate it." : "Why not? That was a good joke!")
                .font(.largeTitle)
                .foregroundColor(.white)
        }
    }
}

struct FeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackView(likedJoke: true)
    }
}
