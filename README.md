# CyberLog – Flutter Project

## Log Class & UI Rendering

### Class Definition
A custom `Log` class was created to structure the log data.  
It contains the following properties:
- `String action`
- `DateTime timestamp`
- `String status`

This helps organize related data into a single structure.

---

### List of Objects
Inside the main widget, a `List<Log>` was created with 3–4 sample log entries:

```dart
List<Log> logs = [
  Log(action: "User Login", timestamp: DateTime.now(), status: "Success"),
  Log(action: "Failed Login Attempt", timestamp: DateTime.now(), status: "Failed"),
  Log(action: "Profile Updated", timestamp: DateTime.now(), status: "Success"),
];

