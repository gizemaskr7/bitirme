import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WatchChannelScreen extends StatefulWidget {
  final String? url;


  const WatchChannelScreen({super.key, required this.url});

  @override
  State<WatchChannelScreen> createState() => _WatchChannelScreenState();
}

class _WatchChannelScreenState extends State<WatchChannelScreen> {
  late WebViewController controller;
  @override
  void initState() {
    super.initState();
    controller= WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url!));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }
  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Canlı Yayın"),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
