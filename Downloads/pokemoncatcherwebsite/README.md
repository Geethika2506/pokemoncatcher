# 🐾 Pokémon Catcher (Flutter Pokédex)

A **Flutter-based Pokédex application** built using the **PokeAPI**, featuring infinite scrolling, Pokémon details, capture functionality, and a favourites collection — designed with **clean architecture** and **production-ready practices**.

The app runs on **Web**, **Android Emulator**, and **Desktop**, with special care taken to ensure Android stability.

---

## 🚀 Features

- 📜 **Pokémon List** with lazy loading (20 Pokémon at a time)
- 🔍 **Pokémon Details Page**
  - Image
  - Height & Weight
  - Types
  - Abilities
  - Base Stats
  - Total moves count
- ⭐ **Capture Pokémon**
- ❤️ **Favourites Page** (captured Pokémon)
- 🔄 Pull-to-refresh
- 🎨 Centralized theming (no hardcoded colors)
- 📱 Responsive layout (mobile, tablet, web)
- 🌐 Flutter Web support

---

## 🧱 Tech Stack

- **Flutter**
- **Dart**
- **PokeAPI** – https://pokeapi.co
- **Riverpod** – State management
- **go_router** – Navigation
- **Dio** – API networking
- **Cached Network Image** – Image caching

---

## 📁 Project Structure

lib/
├── app/ # App entry & router
├── core/ # Theme, networking, utils
├── features/
│ ├── pokemon/
│ │ ├── data/ # Models, API, repositories
│ │ ├── domain/ # Repository contracts
│ │ └── presentation/ # UI & controllers
│ └── favourites/ # Captured Pokémon
└── main.dart


### Clean Architecture Flow
- UI → Presentation
- Business logic → Controllers
- Data access → Repositories & API services

---

## 🖼️ Screens (Optional)

_Add screenshots here once available_

screenshots/
├── list.png
├── details.png
├── favourites.png


---

## ⚙️ Setup & Run

### 1️⃣ Clone the repository

```bash
git clone https://github.com/Geethika2506/pokemoncatcher.git
cd pokemoncatcher
2️⃣ Install dependencies
flutter pub get
(Optional but recommended)

flutter clean
flutter pub get
▶️ Run the App
🌐 Web
flutter run -d chrome
🖥️ Windows Desktop
flutter run -d windows
🤖 Run on Android Emulator (Windows)
✅ Recommended Emulator Setup
Use this configuration for stability:

Setting	Value
Device	Pixel 5
API	33 (Android 13)
System Image	Google APIs (❌ NOT Play Store)
Architecture	x86_64
RAM	4096 MB
VM Heap	512 MB
Graphics	Software
Animations	Disabled
1️⃣ List available emulators
flutter emulators
2️⃣ Launch emulator
flutter emulators --launch Pixel_5
If needed (manual & stable):

& "$env:LOCALAPPDATA\Android\Sdk\emulator\emulator.exe" -avd Pixel_5 -no-snapshot -no-audio -gpu swiftshader_indirect
3️⃣ Run the app on emulator
flutter run -d emulator-5554 --profile --enable-software-rendering
🔧 Fix: Emulator shows offline
If:

adb devices
emulator-5554   offline
### Step 1 — Kill emulator
taskkill /F /IM emulator.exe
taskkill /F /IM qemu-system-x86_64.exe
### Step 2 — Restart ADB
C:\Users\Meher\AppData\Local\Android\Sdk\platform-tools\adb.exe kill-server
C:\Users\Meher\AppData\Local\Android\Sdk\platform-tools\adb.exe start-server
### Step 3 — Relaunch emulator
& "$env:LOCALAPPDATA\Android\Sdk\emulator\emulator.exe" -avd Pixel_5 -no-snapshot -no-audio -gpu swiftshader_indirect
### Step 4 — Verify device
C:\Users\Meher\AppData\Local\Android\Sdk\platform-tools\adb.exe devices
Expected:

emulator-5554   device
If still offline:

C:\Users\Meher\AppData\Local\Android\Sdk\platform-tools\adb.exe disconnect
C:\Users\Meher\AppData\Local\Android\Sdk\platform-tools\adb.exe connect 127.0.0.1:5555
❌ Common Problems & Fixes
"System UI isn’t responding"
Increase emulator RAM (≥ 4GB)

Disable animations in Developer Options

Use profile mode

Use software rendering

flutter run -d emulator-5554 --profile --enable-software-rendering
App crashes / closes suddenly
Usually caused by:

RenderFlex overflow

SliverGrid invalid size

Unsafe null (!) usage

Fixes applied in this project:

Fixed grid layout for Android

Safe list indexing

Flexible Pokémon card layout

🌍 API Reference
Pokémon List
https://pokeapi.co/api/v2/pokemon?limit=20&offset=0

Pokémon Details
https://pokeapi.co/api/v2/pokemon/{id}

🧪 State Management
Riverpod

StateNotifierProvider → Pokémon list & favourites

FutureProvider.family → Pokémon details

 Future Improvements
persist favourites (Hive / SharedPreferences)

Dark mode

Search Pokémon

Evolution chain

 Pokémon descriptions (species API)

Unit & widget tests

👩‍💻 Author
Geethika
GitHub: @Geethika2506

📜 License
This project is for learning and educational purposes.
Pokémon data belongs to Nintendo / Game Freak / The Pokémon Company.


