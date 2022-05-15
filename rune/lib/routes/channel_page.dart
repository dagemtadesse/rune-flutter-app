import 'package:flutter/material.dart';
import './routes.dart';

class ChannelPage extends StatefulWidget {
  const ChannelPage({Key? key}) : super(key: key);

  @override
  State<ChannelPage> createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage> {
  Widget ChannelCard() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return ChannelDetailsPage();
        }));
      },
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Container(
                        constraints:
                            BoxConstraints.expand(height: 220, width: 600),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20.0),
                                topLeft: Radius.circular(20.0)),
                            gradient: LinearGradient(colors: [
                              Color.fromARGB(250, 214, 165, 97),
                              Colors.brown,
                            ])),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/mechanical.jpg"),
                                radius: 80,
                              ),
                            ),
                            Text(
                              "Mechanical Engineering",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        constraints:
                            BoxConstraints.expand(width: 600, height: 60),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nulla diam, mollis feugiat varius nec, pretium eget est. Mauris semper felis tortor, vel malesuada tortor porttitor non. "),
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget SearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60.0),
      child: GestureDetector(
        onTap: () {
          showSearch(
            context: context,
            delegate: CustomSearchDelegate(),
          );
        },
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: Colors.black),
              borderRadius: BorderRadius.circular(12)),
          constraints: BoxConstraints(maxWidth: 500, minWidth: 400),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                  width: 5.0,
                ),
                Icon(Icons.search),
                SizedBox(
                  width: 25.0,
                ),
                Text(
                  "Search For channels",
                  style: TextStyle(color: Colors.grey[400]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget SortingBtns() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 65.0),
      child: Container(
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Text(
                "Trending",
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 15.0,
              ),
              Text(
                "Subscribed",
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
              )
            ],
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.sort_rounded))
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(children: [
          Text(
            "Channels",
            style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10.0,
          ),
          SearchBar(),
          SizedBox(
            height: 5.0,
          ),
          SortingBtns(),
          SizedBox(
            height: 10.0,
          ),
          ChannelCard(),
          ChannelCard(),
          ChannelCard()
        ]),
      ),
    );
  }
}
