# 🎡 Random Helper

<div align="center">

[![Flutter](https://img.shields.io/badge/Flutter-3.5.0%2B-blue?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.5.0%2B-blue?logo=dart)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](#license)
[![Version](https://img.shields.io/badge/Version-1.0.1-informational)](#about)

**A simple, intuitive lucky wheel app for quick, fair decisions.**

[Features](#features) • [Tech Stack](#-tech-stack) • [Installation](#-installation) • [Architecture](#-architecture) • [Project Structure](#-project-structure)

</div>

---

## 🎯 Overview

Random Helper is a Flutter app designed to help you make random, fair decisions. Create custom wheels, shuffle items, use templates, and track your spin history—all offline, with a clean Material Design interface.

---

## ✨ Features

- 🎡 Create & manage custom wheels
- 🔄 Shuffle & restore items (Fisher-Yates algorithm)
- 📚 15+ pre-built templates (Food, Games, Education, etc.)
- 🕑 Complete spin history & statistics
- ⭐ Favorites & bookmarks
- 🌗 Dark/Light mode
- 🎨 6+ color palettes
- 📤 Share wheels & results (WhatsApp, Email, Facebook)
- 🇻🇳 Vietnamese UI
- 🔒 100% offline - All data stored locally

---

## 🛠️ Tech Stack

| Component            | Technology                                        |
| -------------------- | ------------------------------------------------- |
| **Framework**        | Flutter 3.5+                                      |
| **Language**         | Dart 3.5+                                         |
| **Architecture**     | Clean Architecture (Presentation - Domain - Data) |
| **State Management** | Provider Pattern                                  |
| **Database**         | SQLite v2.2.8                                     |
| **UI Framework**     | Material Design 3                                 |

---

## 🚀 Installation

### Prerequisites

- Flutter 3.5+ (latest stable)
- Dart 3.5+
- Android SDK / Xcode (for native builds)

### Steps

**1. Clone the repository**

```bash
git clone https://github.com/MyDang2705/Random_Helper.git
cd Random-helper
```

**2. Install dependencies**

```bash
flutter pub get
```

**3. Run the app**

```bash
flutter run
```

**4. Build release APK**

```bash
flutter build apk --release
```

---

## 📁 Project Structure

```
Random-helper/
├── lib/
│   ├── main.dart                    # App entry point
│   ├── core/
│   │   └── utils/
│   │       ├── theme.dart           # Theme management
│   │       ├── constants.dart       # App constants
│   │       ├── templates.dart       # Wheel templates
│   │       ├── color_palettes.dart  # Color schemes
│   │       ├── sort_options.dart    # Sorting helpers
│   │       └── vietnamese_helper.dart # Vietnamese localization
│   ├── data/
│   │   ├── local/
│   │   │   └── db_helper.dart       # SQLite manager
│   │   ├── repositories/
│   │   │   └── spin_repository_impl.dart # Data layer
│   ├── domain/
│   │   ├── entities/                # Models (spin, item, template)
│   │   ├── repositories/            # Repository interfaces
│   │   └── usecases/
│   │       ├── create_spin.dart     # Create wheel logic
│   │       ├── spin_once.dart       # Spin logic
│   │       ├── get_spins.dart       # Fetch wheels
│   │       ├── shuffle_items.dart   # Shuffle items
│   │       └── restore_items.dart   # Restore items
│   ├── presentation/
│   │   ├── pages/
│   │   │   ├── main_dashboard.dart      # Navigation host
│   │   │   ├── home_page.dart           # Wheel list & search
│   │   │   ├── spin_page.dart           # Spin screen
│   │   │   ├── create_spin_page.dart    # Create wheel
│   │   │   ├── edit_spin_page.dart      # Edit wheel
│   │   │   ├── history_page.dart        # Spin history
│   │   │   ├── favorite_spins_page.dart # Favorites
│   │   │   ├── suggestions_page.dart    # Templates browser
│   │   │   └── settings_page.dart       # Settings
│   │   ├── providers/
│   │   │   ├── spin_provider.dart       # State management
│   │   │   └── theme_provider.dart      # Theme toggle
│   │   └── widgets/
│   │       └── wheel_view.dart          # Animated wheel
├── assets/                          # App assets & icons
├── android/                         # Android native code
├── ios/                             # iOS native code
├── web/                             # Web platform
├── pubspec.yaml                     # Dependencies & config
├── analysis_options.yaml            # Lint rules
└── README.md                        # Documentation
```

---

## 🏗️ Architecture

The app follows **Clean Architecture** with separation of concerns:

```
┌─────────────────────────────────────────┐
│         Presentation Layer              │
│  (UI, Providers, Pages, Widgets)        │
└──────────────┬──────────────────────────┘
							 │
┌──────────────▼──────────────────────────┐
│           Domain Layer                  │
│  (Entities, Repositories, UseCases)     │
└──────────────┬──────────────────────────┘
							 │
┌──────────────▼──────────────────────────┐
│            Data Layer                   │
│  (Models, DataSources, Repositories)    │
└─────────────────────────────────────────┘
```

**Design Patterns Used:**

- **Provider Pattern** - State management
- **Repository Pattern** - Data abstraction
- **Use Case Pattern** - Business logic encapsulation

---

## 🔌 Data Flow

```
UI (Screens)
	↓
Providers (State Management)
	↓
Use Cases (Business Logic)
	↓
Repositories (Data Abstraction)
	↓
Data Sources (SQLite/Local)
```

---

## 📊 Key Metrics

- **Spin Duration:** 2-10 seconds (configurable)
- **Templates:** 15+ built-in templates
- **History:** Tracks all spins, favorites, and statistics
- **Localization:** Vietnamese and English UI

---

## 🔐 Security & Privacy

- ✅ Local data only (no cloud storage)
- ✅ No sensitive data in logs
- ✅ User preferences stored securely

---

## 🐛 Development

### Build & Test

```bash
# Run tests
flutter test

# Analyze code
flutter analyze

# Format code
dart format lib/

# Build for production
flutter build apk --release
```

---

## 📝 Git Workflow

```bash
# Create feature branch
git checkout -b feature/new-feature

# Make changes and commit
git add .
git commit -m "feat: add new feature"

# Push to remote
git push origin feature/new-feature

# Create Pull Request on GitHub
```

---

## 📞 Support & Contributing

- **Bug Reports:** Create an issue on GitHub
- **Feature Requests:** Submit a discussion
- **Pull Requests:** Follow the git workflow above

---

## 📄 License

MIT License - See [LICENSE](LICENSE) file for details.

---

## 👨‍💻 Author

**MyDang2705** - [GitHub Profile](https://github.com/MyDang2705)

---

<div align="center">

Made with ❤️ for decision makers everywhere!

</div>
