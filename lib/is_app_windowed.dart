import 'dart:ui';

import 'package:flutter/material.dart';

/// An inherited widget that provides information about whether
/// the app is running in windowed mode or not.
/// Example usage:
/// ```dart
/// final isWindowed = IsAppWindowed.of(context);
/// ```
class IsAppWindowed extends InheritedWidget {
  const IsAppWindowed({
    super.key,
    required this.isWindowed,
    required super.child,
  });

  final bool isWindowed;

  static bool? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<IsAppWindowed>()
        ?.isWindowed;
  }

  static bool of(BuildContext context) {
    final result = maybeOf(context);
    assert(
      result != null,
      'Unable to find an instance of IsAppWindowed in the widget tree.',
    );
    return result!;
  }

  @override
  bool updateShouldNotify(IsAppWindowed oldWidget) {
    return isWindowed != oldWidget.isWindowed;
  }
}

/// A provider that detects if the app is running in windowed mode
/// and provides the information down the widget tree.
/// Example usage:
/// ```dart
/// void main() {
///  runApp(IsAppWindowedProvider(child: const MyApp()));
/// }
/// ```
class IsAppWindowedProvider extends StatelessWidget {
  const IsAppWindowedProvider({
    super.key,
    this.tolerance = 0.1,
    required this.child,
  });

  final double tolerance;
  final Widget child;

  /// Get if app is running in windowed mode
  bool _getIsWindowed(BuildContext context, {required Display? mainDisplay}) {
    /// DevicePixelRatio eg, 2x, 3x
    final pixelRatio = MediaQuery.devicePixelRatioOf(context);

    /// Get main display, if not exist return false
    if (mainDisplay == null) {
      return false;
    }

    /// Display's orientation, need this to calculate physical size
    final orientation = MediaQuery.orientationOf(context);

    /// Main display size considering orientation
    final mainDisplaySize = switch (orientation) {
      Orientation.portrait => Size(
        mainDisplay.size.width,
        mainDisplay.size.height,
      ),
      Orientation.landscape => Size(
        mainDisplay.size.height,
        mainDisplay.size.width,
      ),
    };

    /// Current app window physical size
    final physicalWindowSize = MediaQuery.sizeOf(context) * pixelRatio;

    return (physicalWindowSize.width - mainDisplaySize.width).abs() >
            tolerance ||
        (physicalWindowSize.height - mainDisplaySize.height).abs() > tolerance;
  }

  @override
  Widget build(BuildContext context) {
    return IsAppWindowed(
      isWindowed: _getIsWindowed(
        context,
        mainDisplay: PlatformDispatcher.instance.displays.firstOrNull,
      ),
      child: child,
    );
  }
}
