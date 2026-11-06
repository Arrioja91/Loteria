//
//  GameViewModel.swift
//  Loteria
//
//  Created by Esteban Arrioja on 11/5/26.
//

import Foundation
import Observation

@Observable
@MainActor
class GameViewModel {
    var deck: [Card] = []
    var called: [Card] = []
    var isPlaying = false
    var isPaused = false
    var interval: Double = 5   // seconds between cards
    var isFinished: Bool {
        !called.isEmpty && deck.isEmpty && !isPlaying
    }

    private var timerTask: Task<Void, Never>?
    private let speaker = Speaker()

    var currentCard: Card? { called.last }

    func startGame() {
        timerTask?.cancel()
        deck = Card.all.shuffled()
        called = []
        isPlaying = true
        isPaused = false
        drawNext()
        startTimer()
    }

    func endGame() {
        speaker.stop()
        timerTask?.cancel()
        isPlaying = false
        isPaused = false
        called = []
    }

    func pause() {
        speaker.stop()
        guard isPlaying, !isPaused else { return }
        timerTask?.cancel()
        isPaused = true
    }

    func resume() {
        guard isPlaying, isPaused else { return }
        isPaused = false
        startTimer()
    }

    func startTimer() {
        timerTask?.cancel()
        timerTask = Task { [weak self] in
            while !Task.isCancelled {
                let seconds = self?.interval ?? 5
                try? await Task.sleep(for: .seconds(seconds))
                guard !Task.isCancelled, let self else { return }
                if self.deck.isEmpty {
                    speaker.say("Se acabó!")
                    self.isPlaying = false
                    return
                }
                self.drawNext()
            }
        }
    }

    func drawNext() {
        guard !deck.isEmpty else { return }
        let card = deck.removeFirst()
        called.append(card)
        speaker.say(card.name)
    }
}
