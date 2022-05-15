import 'package:flutter/material.dart';
import './routes.dart';

class ChannelDetailsPage extends StatefulWidget {
  const ChannelDetailsPage({Key? key}) : super(key: key);

  @override
  State<ChannelDetailsPage> createState() => _ChannelDetailsPageState();
}

class _ChannelDetailsPageState extends State<ChannelDetailsPage> {
  // widget 1 - the department app bar
  Widget customAppBar() {
    return Container(
      constraints: BoxConstraints.expand(height: 300, width: double.infinity),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30)),
          image: DecorationImage(
              image: AssetImage("assets/mechanical.jpg"), fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
                color: Colors.white,
                iconSize: 35.0,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert),
                color: Colors.white,
                iconSize: 35.0,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mechanical Engineering",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididu",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  // widget 2 - user post card
  Widget UserPostWithImg() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
                color: Color.fromARGB(255, 140, 139, 139), width: 1.0),
          ),
          constraints: const BoxConstraints.expand(height: 450),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Padding(
                      padding:
                          const EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 10.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage("assets/test.jpg"),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Publisher Name"),
                              Text("Jan 20 2021")
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_vert),
                    color: Colors.black,
                    iconSize: 25.0,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Text(
                  "Post Title",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                constraints:
                    BoxConstraints.expand(height: 200, width: double.infinity),
                child: Image(
                  image: AssetImage("assets/test.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 0.0),
                child: Text(
                  "This is the random post content apparently wow wow wow wow ",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              PostBottomBtns()
            ],
          ),
        ));
  }

  Widget UserPost() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
                color: Color.fromARGB(255, 140, 139, 139), width: 1.0),
          ),
          constraints: const BoxConstraints.expand(height: 400),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Padding(
                      padding:
                          const EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 10.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage("assets/test.jpg"),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Publisher Name"),
                              Text("Jan 20 2021")
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_vert),
                    color: Colors.black,
                    iconSize: 25.0,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Text(
                  "Post Title",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Container(
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi hendrerit dolor a sagittis ornare. Aenean vestibulum eros a lorem tristique, consectetur lobortis mi aliquam. Nulla condimentum in leo sed pretium. Integer vitae magna sit amet libero commodo fermentum. Maecenas semper justo vel tempus efficitur. Donec feugiat ultrices odio, at varius ligula accumsan quis. Duis in porttitor massa. Aliquam erat volutpat. Cras lorem sem, molestie quis quam ac, semper rhoncus tortor. In justo dolor, ultrices sed nunc at, ornare imperdiet sapien. Nunc non mi laoreet, tempus sem a, aliquam enim.",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
              PostBottomBtns(),
            ],
          ),
        ));
  }

  Widget PostBottomBtns() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Row(
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.upload)),
                        Text("125")
                      ],
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.download)),
                        Text("56")
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.comment_outlined))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          customAppBar(),
          const SizedBox(
            height: 40.0,
          ),
          UserPostWithImg(),
          const SizedBox(
            height: 30.0,
          ),
          UserPost(),
          const SizedBox(
            height: 30.0,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return const AddPostPage();
          }));
        },
        child: Icon(
          Icons.add,
          size: 30.0,
        ),
      ),
    );
  }
}
