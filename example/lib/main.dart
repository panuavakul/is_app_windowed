import 'package:flutter/material.dart';
import 'package:is_app_windowed/is_app_windowed.dart';

void main() {
  runApp(IsAppWindowedProvider(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final isAppWindowed = IsAppWindowed.of(context);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: isAppWindowed ? 56 * 2 : null,
        leading: Align(
          alignment: isAppWindowed
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Swipe from center top of the iPad to enter windowed mode.',
            ),
          ],
        ),
      ),
    );
  }
}
