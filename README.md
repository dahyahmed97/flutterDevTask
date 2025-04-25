
# 📱 Flutter Development Task

This Flutter project implements a two-screen application using Clean Architecture principles, state management via Cubit, and mock API integration. The design is based on a Figma prototype.

---

## 🧑‍🎨 Design Overview

- **Home Screen**: Shows user info, today's meetings, and assigned tasks.
- **Clock-In Screen**: Allows the user to clock in and shows a summary of work hours and history.

🎨 [Figma Design Reference](https://www.figma.com/design/Un0lhXxWu7ZqBzvGVN1TmB/Flutter-Task?node-id=0-1&p=f&t=TP19BtmnNvkQOZIg-0)

---

## 🔧 Project Setup Instructions

1. **Clone or extract the project**

2. **Install dependencies**  
```bash
flutter pub get
```

3. **Run the project**  
```bash
flutter run
```

4. **Build APK (Android)**  
```bash
flutter build apk --release
```

---

## 🧱 Architecture Overview

The project uses **Clean Architecture** and is structured as follows:

```
lib/
├── core/                        # Utilities, error handling, base classes
├── features/
│   └── clockIn/
│       ├── data/                # Mock data sources, models, repositories
│       ├── domain/              #  use cases, abstract repos
│       ├── presentation/
 └── home/
│       ├── data/                # Mock data sources, models, repositories
│       ├── domain/              #  use cases, abstract repos
│       ├── presentation/            # Cubits, UI screens
│       
                   
└── main.dart                    # Entry point with DI setup
```

---

## 🧠 State Management

State management is handled using **Cubit** (from flutter_bloc). It manages the flow of data between the UI and the underlying logic.



Each Cubit simulates API calls using `Future.delayed` and returns mock responses.

---



## 📦 Dependencies Used

| Package         | Description                            |
|----------------|----------------------------------------|
| flutter_bloc    | Cubit & Bloc state management          |
| get_it          | Dependency Injection (service locator) |
| equatable       | Simplifies state comparison            |
| flutter_screenutil | Optional: For responsive UI layouts |
| dio             | for network calls                      |
| dartZ           | for reactive programming               |
| google fonts    | for handling fonts                     |
| connectivity plus | for checking internet connection     |
| dartZ           | for reactive programming               |

there's is some other packages used as this code base is built over a skeleton i built

---

## 📄 Build & Run Commands

| Action                | Command                        |
|-----------------------|--------------------------------|
| Install dependencies  | `flutter pub get`              |
| Run the app           | `flutter run`                  |
| Build APK             | `flutter build apk --release`  |

---

## ✅ Deliverables Recap

- [x] Pixel-perfect UI based on Figma
- [x] Clean Architecture implementation
- [x] Mock API with simulated delays
- [x] Cubit state management
- [x] Android APK build support
- [x] Full source code with modular structure
- [x] This README.md file

---

## 👨‍💻 Author

Made by Dahy Ahmed  
Cross-platform Mobile Developer

---

## 📜 License

This project is for demonstration purposes only.
