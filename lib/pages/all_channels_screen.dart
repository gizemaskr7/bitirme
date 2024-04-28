import 'package:bitirme/channels.dart';
import 'package:bitirme/pages/watch_channel_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllChannelsScreen extends StatefulWidget {
  String channelTitle;

  AllChannelsScreen({super.key, required this.channelTitle});


  @override
  State<AllChannelsScreen> createState() => _AllChannelsScreenState();
}

class _AllChannelsScreenState extends State<AllChannelsScreen> {
  List<String> categories = [];

  getCategories() {
    for (var channel in Channels().channels) {
      if(!categories.contains(channel['channel_category']!)){
        categories.add(channel['channel_category']!);
      }
    }
    return categories.toList();
  }

  @override
  void initState() {
    getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final channelsByCategory = Channels().channels.where((channel) => channel['channel_category'] == widget.channelTitle).toList();
    int selectedIndex = categories.indexOf(widget.channelTitle);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.channelTitle),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height/8,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FilterChip(
                    label: Text(categories[index]),
                    selected: index == selectedIndex,
                    selectedColor: Colors.blue,
                    checkmarkColor: Colors.white,
                    onSelected: (value) {
                      setState(() {
                        selectedIndex = index;
                        widget.channelTitle = categories[index];
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: channelsByCategory.length,
              itemBuilder: (context, index) {
                final channel = channelsByCategory[index];
                return  InkWell(
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
      ),
    );
  }
}
