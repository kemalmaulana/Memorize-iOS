//
//  ContentView.swift
//  Memorize
//
//  Created by Kemal Maulana on 29/12/22.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["✈️", "🛫", "🚀", "🚃", "🚅", "🗿", "🚐", "🚗", "🛻", "🚜", "🛴", "🩼", "🚲", "🚖", "🚝", "🚅", "🚕", "🚙"]
    
    @State var emojiCount = 18
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 72))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            
        }
        .padding(.horizontal)
    }
    
    var remove: some View {
        Button{
            if(emojiCount > 1) {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var add: some View {
        Button{
            if(emojiCount < emojis.count) {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if (isFaceUp) {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            self.isFaceUp = !self.isFaceUp
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
