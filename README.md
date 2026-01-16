This package is for checking if the App is running in windowed mode.
In iPadOS 26, Apple introduced windowed mode for iPad apps, allowing users to
resize and move apps around the screen. When the app is in Windows mode there will be a 🚥, which is shown at the top left corner of the app window. This will likely block the button of the top left, which are usually important button like back and such. This package helps developers to detect if their app is running in windowed mode, enabling them to adjust their UI and
functionality accordingly.

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

### Slide the

## Additional information

This package is specifically designed for iPadOS, I have not tested it on other Android tablets that may also support windowed mode.

If you find any issues or have suggestions for improvement, please feel free to open an issue or submit a pull request on the GitHub repository.
