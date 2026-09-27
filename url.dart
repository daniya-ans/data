import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(
    const MaterialApp(
      home: UrlNavigation(),
    ),
  );
}

class UrlNavigation extends StatelessWidget {
  const UrlNavigation({super.key});

  Future<void> _navUrl() async {
    final Uri _url = Uri.parse('https://www.google.com');

    if (!await launchUrl(
      _url,
      mode: LaunchMode.externalApplication,
    )) {
      throw "could not find the site";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("URL Navigation"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _navUrl,
          child: const Text("Let'sss Gooo!!!"),
        ),
      ),
    );
  }
}