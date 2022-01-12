//
//  ContentView.swift
//  GuessYourScore
//
//

import SwiftUI

struct ContentView: View {
    
    @State private var sliderValue = 50.0
    @State private var gameLogic = GameLogic()
    
    var body: some View {
        VStack {
            RestartButton(gameLogic: $gameLogic)
            Spacer()
            InfoView(gameLogic: $gameLogic)
            SliderView(sliderValue: $sliderValue)
            MyGuessButton(gameLogic: $gameLogic, sliderValue: $sliderValue)
            Spacer()
            ScoreView(gameLogic: $gameLogic)
                .padding()
        }
    }
}

struct SliderView: View {
    
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            Text("1")
            Slider(value: $sliderValue, in: 1.0...100.0)
            Text("100")
        }
        .padding()
    }
}

struct MyGuessButton: View {
    @Binding var gameLogic: GameLogic
    @Binding var sliderValue: Double
    
    var body: some View {
        
        let roundedValue = Int(sliderValue.rounded())
        let points = gameLogic.points(sliderValue: roundedValue)
        
        Button(action: {
            gameLogic.startNewRound(points: points)
        }) {
            Text("My guess is".uppercased())
                .bold()
                .font(.title3)
        }
    }
}

struct RestartButton: View {
    @Binding var gameLogic: GameLogic
    
    var body: some View {
        Button(action: {
            gameLogic.restart()
        }) {
            Text("Restart".uppercased())
                .bold()
                .font(.title3)
        }
    }
}

struct NumberView: View {
    var title: String
    var text: String
    
    var body: some View{
        VStack{
            Text(title)
            Text(text)
        }
    }
}

struct ScoreView: View {
    
    @Binding var gameLogic: GameLogic
    
    var body: some View {
        HStack {
            NumberView(title: "Round:", text: String(gameLogic.round))
            Spacer()
            NumberView(title: "Score:", text: String(gameLogic.score))
        }
    }
}

struct InfoView: View {
    
    @Binding var gameLogic: GameLogic
    
    var body: some View {
        Text("Put the slider where you think number \(String(gameLogic.target)) is")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
