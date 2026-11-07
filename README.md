# Lotería Caller

An iOS app that acts as the caller for a game of Lotería. It draws the 54 cards in random order on an adjustable timer and announces each one aloud in Spanish, so a group can play with their own boards.

<!-- Add a screenshot or short screen recording here, for example: -->
<!-- ![Lotería Caller screenshot](screenshots/caller.png) -->

## Features

- Random shuffle of all 54 cards each game, with no repeats
- Automatic calling on an adjustable interval (3, 5, or 8 seconds)
- Spanish voice announcement of each card (Mexican Spanish, `es-MX`)
- Pause and resume, with a fresh full interval after resuming
- Live speed changes mid-game
- "¡Se acabó!" end screen with a Play Again button
- Progress counter showing how many cards have been called

## Tech

- Swift and SwiftUI
- `@Observable` and `@MainActor` for state management
- Swift concurrency (`Task`, `Task.sleep`, cancellation) for the call timer
- `AVSpeechSynthesizer` (AVFoundation) for text-to-speech

## Project structure

| File | Purpose |
| --- | --- |
| `Card.swift` | The `Card` model and the full 54-card deck |
| `GameViewModel.swift` | Game state, shuffling, timer, pause and resume |
| `Speaker.swift` | Wrapper around `AVSpeechSynthesizer` |
| `ContentView.swift` | SwiftUI screens: start, game, and finished |
| `LoteriaApp.swift` | App entry point |

Game logic lives in the view model and model, separate from the views.

## Requirements

- Xcode 15 or later
- iOS 17 or later (uses the `Observation` framework)

## Running the app

1. Clone the repo:
   ```bash
   git clone https://github.com/YOUR-USERNAME/Loteria.git
   ```
2. Open `Loteria.xcodeproj` in Xcode.
3. Select an iPhone simulator or a connected device and press **Cmd + R**.

Speech works best on a physical device. The simulator can have limited or missing voices. For a better sound, download an Enhanced or Premium Spanish voice in **Settings > Accessibility > Spoken Content > Voices**.

## Roadmap

- Previously called cards list
- Keep the screen awake during a game
- Traditional rhymes read before each card name
- Card artwork

## Notes

Card names follow the traditional Lotería deck. Spellings vary slightly between printings.
