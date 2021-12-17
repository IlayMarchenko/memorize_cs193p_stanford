import SwiftUI

struct ContentView: View {
    @State var emojis: [String] = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🦽"].shuffled()
    
    @State var emojiCounter = 12
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle).padding(.horizontal)
                        
            ScrollView {
                LazyVGrid (columns:[GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCounter], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            
            Spacer()
            
            HStack {
                vehiclesTheme
                Spacer()
                animalsTheme
                Spacer()
                peopleTheme
            }
            .padding(.horizontal)
            
            .padding(.horizontal)
            .font(.largeTitle)
        }
        .padding(.horizontal)
    }
    
    var vehiclesTheme: some View {
        Button {
            emojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🦽"]
            emojis.shuffle()
            
        } label: {
            VStack {
                Image(systemName: "car")
                Text("vihicles").font(.footnote)
            }
        }
    }
    
    var animalsTheme: some View {
        Button {
            emojis = ["🐶", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🙊", "🐗", "🦄"]
            emojis.shuffle()
        } label: {
            VStack {
                Image(systemName: "pawprint")
                Text("animals").font(.footnote)
            }
        }
    }
    
    var peopleTheme: some View {
        Button {
            emojis = ["🧕🏻", "👮‍♀️", "👨‍🍳", "👩🏻‍🎓", "👩🏼‍🔧", "👩🏽‍🚒", "🧑🏻‍🎨", "👩‍✈️", "👩🏻‍🚀", "👰🏻‍♂️", "🥷", "🤴🏿", "🧙🏻‍♀️"]
            emojis.shuffle()
        } label: {
            VStack {
                Image(systemName: "person")
                Text("people").font(.footnote)
            }
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp = true
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 25)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }

        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}
