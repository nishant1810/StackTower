# 🏰 Stack Tower

<p align="center">
  <img src="assets/images/title.webp" alt="Stack Tower Title" width="380"/>
</p>

<p align="center">
  <img src="assets/images/icon.webp" alt="Stack Tower Icon" width="120" style="border-radius: 24px;"/>
</p>

<p align="center">
  <strong>An addictive, precision-timed block stacking arcade game built with Flutter & Flame Engine.</strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white" alt="Flutter"/>
  <img src="https://img.shields.io/badge/Dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white" alt="Dart"/>
  <img src="https://img.shields.io/badge/Flame%20Engine-FF6B6B.svg?style=for-the-badge&logo=gamepad&logoColor=white" alt="Flame"/>
  <img src="https://img.shields.io/badge/Firebase-%23039BE5.svg?style=for-the-badge&logo=firebase" alt="Firebase"/>
  <img src="https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web-brightgreen.svg?style=for-the-badge" alt="Platforms"/>
  <img src="https://img.shields.io/badge/Tests-Passing-success.svg?style=for-the-badge" alt="Tests"/>
</p>

---

## 📸 Game Screens

Explore the visual design, neon cyber aesthetics, interactive menus, and customizable themes of Stack Tower:

### 🎮 Primary Game Experience

| Splash Screen | Main Lobby / Home |
| :---: | :---: |
| <img src="assets/images/splash_bg.webp" alt="Splash Screen" width="340"/> | <img src="assets/images/home_bg.webp" alt="Home Screen" width="340"/> |
| *Immersive cyber animated startup loader* | *Dynamic glowing UI with animated quick-access dock* |

| Game Over / Revive | New High Score Record |
| :---: | :---: |
| <img src="assets/images/game_over.webp" alt="Game Over Screen" width="340"/> | <img src="assets/images/new_best.webp" alt="New Best Score" width="340"/> |
| *Score tally, rewards earned, and rewarded revive* | *Special celebratory particle explosion and rank badge* |

---

### 🏆 Progression & Reward Hubs

| Daily Rewards Calendar | Global & Personal Leaderboards |
| :---: | :---: |
| <img src="assets/images/daily_reward_bg.webp" alt="Daily Reward" width="340"/> | <img src="assets/images/leaderboard_bg.webp" alt="Leaderboard" width="340"/> |
| *Consecutive daily login streak chest rewards* | *Live Firestore real-time global player rankings* |

| Achievements & Milestones | Google Cloud Sync / Profile |
| :---: | :---: |
| <img src="assets/images/achievement_bg.webp" alt="Achievements" width="340"/> | <img src="assets/images/login.webp" alt="Google Login" width="340"/> |
| *Unlockable challenges with coin & gem rewards* | *Seamless Google Sign-In with cloud progress sync* |

| Theme Wardrobe | In-Game Store |
| :---: | :---: |
| <img src="assets/images/theme_bg.webp" alt="Themes Screen" width="340"/> | <img src="assets/images/shop_bg.webp" alt="Shop Screen" width="340"/> |
| *Custom towers, ambient lighting, and particle effects* | *Currency packs, premium cosmetics, and boosts* |

---

### 🎨 Thematic Worlds & Arenas

Stack Tower features 6 distinct customizable visual environments with reactive block gradients and color palettes:

| Sky Citadel (Classic) | Neon Cyber | Purple Crystal Storm |
| :---: | :---: | :---: |
| <img src="assets/images/sky_theme.webp" alt="Sky Citadel" width="220"/> | <img src="assets/images/neon_theme.webp" alt="Neon Cyber" width="220"/> | <img src="assets/images/purple_theme.webp" alt="Purple Crystal Storm" width="220"/> |
| *Breezy atmospheric heights* | *Vibrant synthwave aesthetic* | *Electric crystal energy* |

| Emerald Realm | Lava Inferno | Galaxy Nexus |
| :---: | :---: | :---: |
| <img src="assets/images/emerald_theme.webp" alt="Emerald Realm" width="220"/> | <img src="assets/images/lava_theme.webp" alt="Lava Inferno" width="220"/> | <img src="assets/images/galaxy_theme.webp" alt="Galaxy Nexus" width="220"/> |
| *Lush bioluminescent greens* | *High-stakes molten magma* | *Deep space cosmic void* |

---

## ✨ Features

- **🎯 Precision Stacking Engine**: High-performance Flame Game 2D physics simulation with realistic slice and fall mechanics.
- **⚡ Perfect Combo Ramp**: Nail consecutive perfect placements to ramp up audio pitch, ignite golden particle explosions, and trigger streak bonus text (`PERFECT x3`, `UNSTOPPABLE`).
- **🎥 Dynamic Camera Tracking**: Smooth isometric viewport following your tower as you ascend into the stratosphere.
- **💎 Multi-Currency Economy**: Earn coins and crystals through gameplay, combos, daily reward streaks, and in-game achievements.
- **🌐 Global & Personal Leaderboards**: Live cloud rankings powered by Firebase Firestore, showcasing the top stackers worldwide.
- **🔐 Cloud Save & Authentication**: Cross-platform player progress synchronization with Google Sign-In.
- **🛍️ Store & In-App Purchases**: Seamless purchasing of coin bundles and premium themes via official Google Play Billing / App Store Kit.
- **📺 Smart Monetization**: Rewarded video ad integration allowing players a second chance to continue runs and double rewards.
- **🎵 Sensory Polish**: Rich spatial sound effects, progressive pitch cues, customizable ambient music, and tactile haptic feedback.

---

## 🏛 Architecture & Codebase Layout

The project follows a scalable, feature-first clean architecture:

```
stack_tower/
├── assets/
│   ├── audio/              # Sound effects and soundtrack (bg_music, perfect, etc.)
│   └── images/             # HD game backgrounds, UI elements, badges & icons
├── lib/
│   ├── app/                # App bootstrap, MaterialApp config, router & theme
│   │   ├── bootstrap/      # Async service initialization pipeline
│   │   ├── router/         # App navigation routing
│   │   └── theme/          # Cyberpunk typography, glows, palettes & styling
│   ├── core/               # Shared cross-cutting modules
│   │   ├── assets/         # AppAssets constants and helpers
│   │   ├── helpers/        # ThemeAssets and asset resolvers
│   │   ├── layout/         # Responsive layout utilities
│   │   └── services/       # Ads, Audio, Auth, Haptics, IAP, Storage & Settings
│   ├── engine/             # Flame game engine components & physics
│   │   ├── components/     # Tower blocks, falling slices & hitboxes
│   │   ├── effects/        # Particle explosions, flashes & floating particles
│   │   └── game/           # Main StackGame loop, input handling & camera
│   ├── features/           # Feature-driven UI and state
│   │   ├── achievements/   # Achievements grid, progression & claim dialogs
│   │   ├── auth/           # Google Sign-In & player onboarding
│   │   ├── daily_reward/   # Multi-day streak calendar & reward chest
│   │   ├── game_over/      # Standard & New Best Game Over screens
│   │   ├── gameplay/       # In-game HUD, combo streak counters & pause
│   │   ├── home/           # Main menu, floating islands, aurora & quick dock
│   │   ├── leaderboard/    # Firestore global ranking & personal best history
│   │   ├── pause/          # Interactive neon pause overlay
│   │   ├── profile/        # Player stats, rank badge & account settings
│   │   ├── settings/       # Audio, haptics & theme switch controls
│   │   ├── shop/           # Coin packs, gem packs & currency bar
│   │   ├── splash/         # Animated cyber loading & initialization sequence
│   │   └── themes/         # Theme catalog, palette selectors & previews
│   └── main.dart           # App entry point
└── test/
    └── widget_test.dart    # Automated smoke, theme catalog & model tests
```

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (v3.12.0 or newer)
- [Dart SDK](https://dart.dev/get-dart) (v3.12.0 or newer)
- Android Studio / VS Code with Flutter extension
- An active Android emulator, physical device, or desktop environment

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/stack_tower.git
   cd stack_tower
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Verify analyzer & diagnostics**:
   ```bash
   flutter analyze
   ```
   *(Expected output: `No issues found!`)*

4. **Run unit & widget test suite**:
   ```bash
   flutter test
   ```
   *(Expected output: `All tests passed!`)*

5. **Launch the game**:
   ```bash
   flutter run
   ```

---

## 🛠 Testing & Quality Assurance

Run the test suite at any time:

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage
```

Test coverage includes:
- **ThemeCatalog Unit Tests**: Theme definitions, palette mappings, and ID lookup logic.
- **AchievementModel Logic Tests**: Completion progress calculations and reward validations.
- **Widget Smoke Tests**: Theme tree rendering and UI component stability.

---

## 📦 Building for Production

### Android (APK & App Bundle)

```bash
# Build Android App Bundle (Google Play release)
flutter build appbundle --release

# Build split APKs
flutter build apk --split-per-abi --release
```

### iOS

```bash
flutter build ipa --release
```

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
