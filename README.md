## SESSION 2

## JIT vs. AOT Compilation in Dart

Dart uses two different compilation methods depending on whether you are developing or releasing your app.

### JIT (Just-In-Time) Compilation
- Used during **development** (debug mode).
- Compiles Dart code **while the app is running**.
- Enables **Hot Reload**, making development fast.
- Ideal for quick iterations and UI changes.

### AOT (Ahead-Of-Time) Compilation
- Used for **release builds** (APK, IPA).
- Compiles Dart code into **optimized machine code before running**.
- Provides **faster startup times**.
- Offers **better overall performance** for final builds.

## Using Dart Conditionals for Even/Odd Checking

In this project, a number from the TextField is first read as a **String**, converted into an **int**, and then checked using a simple conditional:

```dart
if (number % 2 == 0) {
  result = "The number $number is Even.";
} else {
  result = "The number $number is Odd.";
}


result = "The number $number is Even.";
```
