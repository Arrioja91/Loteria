//
//  ContentView.swift
//  Loteria
//
//  Created by Esteban Arrioja on 11/5/26.
//

import SwiftUI

struct ContentView: View {
    @State private var game = GameViewModel()

    var body: some View {
        if game.called.isEmpty {
            Button("Start Game") { game.startGame() }
                .font(.title)
                .buttonStyle(.borderedProminent)
        }
        else if game.isFinished {
            // End of deck
            VStack(spacing: 24) {
                Text("¡Se acabó!")
                    .font(.system(size: 48, weight: .bold))
                Text("All \(Card.all.count) cards have been called.")
                    .foregroundStyle(.secondary)
                Button("Play Again") { game.startGame() }
                    .font(.title)
                    .buttonStyle(.borderedProminent)
            }
            .padding()
        }
        else {
            VStack(spacing: 32) {
                Spacer()

                if let card = game.currentCard {
                    VStack(spacing: 12) {
                        Text(card.name)
                            .font(.system(size: 48, weight: .bold))
                            .multilineTextAlignment(.center)
                    }
                    .id(card.id)
                    .transition(.opacity)
                }
                
                if game.isPaused {
                    Text("Paused")
                        .font(.largeTitle)
                        .foregroundStyle(.red)
                }
                Spacer()

                Text("\(game.called.count) of \(Card.all.count) called")
                    .font(.footnote)
                    .foregroundStyle(.secondary)

                Picker("Speed", selection: $game.interval) {
                    Text("3s").tag(3.0)
                    Text("5s").tag(5.0)
                    Text("8s").tag(8.0)
                }
                .pickerStyle(.segmented)
                .onChange(of: game.interval) {
                    if game.isPlaying && !game.isPaused {
                        game.startTimer()
                    }
                }
                
                Button(game.isPaused ? "Resume" : "Pause") {
                    if game.isPaused { game.resume() } else { game.pause() }
                }
                .buttonStyle(.borderedProminent)

                Button("End Game") { game.endGame() }
            }
            .padding()
            .animation(.easeInOut, value: game.currentCard)
        }
    }
}

#Preview {
    ContentView()
}
