import 'package:flutter/material.dart';

class AllChannelsScreen extends StatefulWidget {
  final String channelTitle;

  const AllChannelsScreen({super.key, required this.channelTitle});


  @override
  State<AllChannelsScreen> createState() => _AllChannelsScreenState();
}

class _AllChannelsScreenState extends State<AllChannelsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.channelTitle),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
