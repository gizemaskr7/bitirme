import 'package:bitirme/channels.dart';
import 'package:bitirme/pages/all_channels_screen.dart';
import 'package:bitirme/pages/watch_channel_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hoşgeldiniz"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            _buildChannelList('Genel'),
            _buildChannelList('Spor'),
            _buildChannelList('Haber'),
            _buildChannelList('Çizgi Film'),
            _buildChannelList('Belgesel'),
            _buildChannelList('Müzik'),
            _buildChannelList('Ekonomi'),

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
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(category, style: const TextStyle(fontSize: 24)),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: () {
                Get.to(()=> AllChannelsScreen(channelTitle: category,),transition: Transition.rightToLeft,duration: const Duration(milliseconds: 800));
              },
            )
          ],
        ),
        const Divider(),
        SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: channelsByCategory.isNotEmpty ?  channelsByCategory.length : 0,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final channel = channelsByCategory[index];
              return InkWell(
                onTap: () {
                  Get.to(()=>WatchChannelScreen(url: channel['channel_url']),transition: Transition.size,duration: const Duration(milliseconds: 800));
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
                            style: const TextStyle(fontSize: 18),
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
