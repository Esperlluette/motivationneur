import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motivationneur/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Motivator 4000',
        home: const Splashscreen(),
        routes: appRoutes(context));
  }
}

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    start();
    init();
  }

  void start() {
    Timer(const Duration(milliseconds: 350), () {
      if (_visible) return;
      setState(() {
        if (kDebugMode) {
          print("Setting visibility to true.");
        }
        _visible = true;
      });
    });
  }

  void init() {
    Timer(const Duration(seconds: 5), () {
      if (kDebugMode) {
        print("Redirect to root");
      }
      Navigator.pushReplacementNamed(context, 'root');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 35, 95, 37),
        body: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 700),
          child: Center(
            child: Text(
              'Motivationneur',
              style: GoogleFonts.lobster(fontSize: 50, color: Colors.white),
            ),
          ),
        ),
      ),
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
    return Scaffold(
      body: Center(
        child: GridView.count(
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: builder(),
        ),
      ),
    );
  }

  List<Widget> builder() {
    List<Widget> widgets = [];
    for (var i = 0; i < 10; i++) {
      widgets.add(
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 35, 95, 37),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          width: 1,
          height: 1,
          child: const Text(
              'Velit consequat est consectetur incididunt ipsum elit eu eu sint non ullamco incididunt.'),
        ),
      );
    }
    return widgets;
  }
}
