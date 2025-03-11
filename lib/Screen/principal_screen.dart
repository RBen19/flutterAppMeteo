import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PrincipalScreen extends StatefulWidget {
  @override
  _PrincipalScreenState createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends State<PrincipalScreen> {
  double _progress = 0.0;
  int _messageIndex = 0;
  final List<String> _messages = [
    "Nous téléchargeons les données…",
    "C’est presque fini…",
    "Plus que quelques secondes avant d’avoir le résultat…"
  ];

  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  void _startLoading() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_progress < 1.0) {
        setState(() {
          _progress += 0.2;
          _messageIndex = (_messageIndex + 1) % _messages.length;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitWave(color: Colors.white, size: 50.0), // Animation de chargement
            SizedBox(height: 20),
            LinearProgressIndicator(
              value: _progress,
              backgroundColor: Colors.grey[700],
              color: Colors.blueAccent,
              minHeight: 8,
            ),
            SizedBox(height: 20),
            Text(
              _messages[_messageIndex],
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
