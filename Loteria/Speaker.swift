//
//  Speaker.swift
//  Loteria
//
//  Created by Esteban Arrioja on 11/6/26.
//

import AVFoundation

final class Speaker {
    private let synthesizer = AVSpeechSynthesizer()

    func say(_ text: String) {
        // Stop anything still being spoken so cards never overlap
        synthesizer.stopSpeaking(at: .immediate)

        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "es-MX")
        utterance.rate = 0.45   // 0.0 to 1.0; default is about 0.5
        synthesizer.speak(utterance)
    }

    func stop() {
        synthesizer.stopSpeaking(at: .immediate)
    }
}
