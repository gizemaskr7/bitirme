import 'package:bitirme/channels.dart';
import 'package:bitirme/pages/watch_channel_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hoşgeldiniz"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildChannelList('Genel'),
          ],
        ),
      ),
    );
  }

  Widget _buildChannelList(String category) {
    final channelsByCategory = Channels().channels.where((channel) => channel['channel_category'] == category).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Başlık $category", style: TextStyle(fontSize: 24)),
        ),
        const Divider(),
        SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: channelsByCategory.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final channel = channelsByCategory[index];
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => WatchChannelScreen(url: channel['channel_url']),));
                },
                child: Card(
                  margin: const EdgeInsets.all(10),
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.network(
                          channel['channel_logo'] ?? '',
                          width: 100,
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            channel['channel_name'] ?? '',
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
