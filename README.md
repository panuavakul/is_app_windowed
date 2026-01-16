This package is for checking if the App is running in windowed mode.
In iPadOS 26, Apple introduced windowed mode for iPad apps, allowing users to
resize and move apps around the screen. When the app is in Windows mode there will be a traffic light buttons 🚥, which is shown at the top left corner of the app window. This will likely block the button of the top left, which are usually important button like back and such. This package helps developers to detect if their app is running in windowed mode, enabling them to adjust their UI and
functionality accordingly.

| Before | After |
| :--- | :---: |
| <img width="341" height="337" alt="Screenshot 2026-01-16 at 19 34 41" src="https://github.com/user-attachments/assets/f03f835d-2573-492b-933e-d28be67eb495" /> | <img width="311" height="323" alt="Screenshot 2026-01-16 at 19 34 48" src="https://github.com/user-attachments/assets/d6509d60-0dc5-41b8-81b0-8b70fedc98db" /> |





## Usage

### Import the package

```dart
import 'package:is_app_windowed/is_app_windowed.dart';
```

### Wrap the app with

```dart
void main() {
  runApp(IsAppWindowedProvider(child: const MyApp()));
}
```

### Check if the app is windowed

```dart
bool isWindowed = IsAppWindowed.of(context).isWindowed;
```

## Common use cases

### Slide the leading button in AppBar so that it won't be obstructed by the 🚥

```dart
final isAppWindowed = IsAppWindowed.of(context);

AppBar(
  leadingWidth: isAppWindowed ? 56 * 2 : null,
  leading: Align(
    alignment: isAppWindowed
        ? Alignment.centerRight
        : Alignment.centerLeft,
    child: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
  ),
  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
  title: Text(widget.title),
)
```

### Slide the

## Additional information

This package is specifically designed for iPadOS, I have not tested it on other Android tablets that may also support windowed mode.

If you find any issues or have suggestions for improvement, please feel free to open an issue or submit a pull request on the GitHub repository.
