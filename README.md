# 🎨 Color Hunter

A minimalist iOS puzzle game developed with **SwiftUI** where players must identify the only tile with a slightly different color before time runs out. The game dynamically increases its difficulty by reducing both the available time and the color contrast as the player's score improves.

<p align="center">
  <img src="screenshots/home.png" width="260">
  <img src="screenshots/gameplay.png" width="260">
</p>

---

## Overview

Color Hunter is a reaction and visual perception game inspired by classic color-recognition puzzles. Each round presents a 4×4 grid of identical colors, with only one tile containing a subtle variation. Players must quickly identify the different tile before the countdown expires.

As the game progresses, both the color distinction and the available time decrease, creating a progressively more challenging gameplay experience.

---

## Features

- 4×4 dynamic color grid
- Procedurally generated colors using the HSB color model
- Progressive difficulty system
- Adaptive countdown timer
- High score persistence with AppStorage
- Responsive SwiftUI interface
- Instant game restart
- Clean and lightweight architecture

---

## Gameplay

- Find the tile with the different color.
- Tap the correct tile before the timer ends.
- Each correct answer increases the score.
- Difficulty increases automatically by:
  - Reducing color difference
  - Shortening the available time
- Selecting the wrong tile or running out of time ends the game.

---

## Screenshots

<p align="center">
  <img src="Ekran Resmi 2026-07-11 00.17.55">
  <img src="Ekran Resmi 2026-07-11 00.18.23">
</p>

---

## Technical Details

| Category | Technology |
|-----------|------------|
| Language | Swift |
| Framework | SwiftUI |
| Storage | AppStorage |
| UI Layout | LazyVGrid |
| Timing | Timer |
| Color System | HSB (Hue, Saturation, Brightness) |

---

## Project Structure

```
ColorHunter
│
├── ColorHunterApp.swift
├── ContentView.swift
├── Assets.xcassets
├── Preview Content
└── screenshots
```

---

## Installation

```bash
git clone https://github.com/ilaydagumustekin/ColorHunter.git
```

Open the project with **Xcode 16 or later** and run it on an iOS Simulator or a physical device.

---

## Future Improvements

- Dynamic grid sizes (5×5, 6×6, 7×7)
- Difficulty modes
- Haptic feedback
- Sound effects
- Animations
- Game Center leaderboard
- Achievement system

---

## License

This project was developed for educational purposes to practice **SwiftUI**, state management, timers, and dynamic UI generation.
