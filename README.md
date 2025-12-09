## SESSION 1
### **1. Native vs. Cross‑Platform Development**

* **Native apps** are built specifically for one platform (Android → Kotlin/Java, iOS → Swift/Objective‑C).
* They offer **best performance**, **full hardware access**, and **platform‑specific UI**.
* **Cross‑platform apps** (like Flutter) allow writing **one codebase** that runs on Android, iOS, Windows, macOS, Linux, and Web.
* Flutter uses the **Dart** language and its own rendering engine, giving **near‑native performance**.

### **2. Hot Reload**

* One of Flutter’s best features.
* Allows you to **instantly apply code changes** without restarting the entire app.
* Improves productivity while designing UI or fixing bugs.
* Keeps the current app state intact.

### **3. Widgets in Flutter**

* Everything in Flutter is a **widget**.
* Widgets describe **what the UI should look like**.
* Two types of widgets:

  * **StatelessWidget** → UI does not change.
  * **StatefulWidget** → UI updates when state changes.
* Complex UIs are built by **nesting smaller widgets**.

---

## Steps to Install and Run the App

### **1. Install Flutter SDK**

Follow the official installation guide for your OS:

* [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)

After installing, add Flutter to PATH.

### **2. Check Flutter Installation**

Run the following command:

```bash
flutter doctor
```

This checks:

* Flutter SDK setup
* Android Studio / Xcode
* Device configuration
* Dart SDK

Fix any issues shown by `flutter doctor`.

---

## Running the Flutter App

### **1. Project Creation**

I created this Flutter app locally using the following command:

```bash
flutter create <project-name>
```

Then I opened the project folder in VS Code only and continued development.

### **2. Install Dependencies**

```bash
flutter pub get
```

### **2. Install Dependencies**

```bash
flutter pub get
```

### **3. Connect a Device / Start Emulator**

* Plug in a real device → enable USB debugging
* Or start an Android emulator

Check available devices:

```bash
flutter devices
```

### **4. Run the App**

```bash
flutter run
```
