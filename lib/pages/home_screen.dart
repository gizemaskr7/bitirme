import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hoşgeldiniz"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Başlık Spor",style: TextStyle(fontSize: 24),),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {

                },
              )
            ],
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    child: const Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FlutterLogo(),
                            Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text("Kanal Adı",style: TextStyle(fontSize: 18),textAlign: TextAlign.center,),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Başlık Spor",style: TextStyle(fontSize: 24),),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {

                },
              )
            ],
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    child: const Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FlutterLogo(),
                            Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text("Kanal Adı",style: TextStyle(fontSize: 18),textAlign: TextAlign.center,),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Başlık Spor",style: TextStyle(fontSize: 24),),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {

                },
              )
            ],
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    child: const Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FlutterLogo(),
                            Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text("Kanal Adı",style: TextStyle(fontSize: 18),textAlign: TextAlign.center,),
                            )
                          ],
                        ),
                      ],
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
