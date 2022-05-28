import 'package:flutter/material.dart';

class CreateChannelPage extends StatelessWidget {
  const CreateChannelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  Color.fromRGBO(97, 67, 133, 1.0),
                  Color.fromRGBO(23, 0, 118, 1.0)
                ]),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 21, top: 29),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: const AssetImage("assets/channel.png"),
                  radius: 50.0,
                  child: IconButton(
                    iconSize: 40.84,
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(
                  width: 38,
                ),
                const Text(
                  "Channel Icon",
                  style: TextStyle(fontFamily: "Poppins", fontSize: 16),
                )
              ],
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Channel name',
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'description',
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            TextFormField(
              //initialValue:"flashtomson@yourmoms.com" ,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'E-mail address',
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            TextFormField(
              //initialValue:"flashtomson@yourmoms.com" ,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Location',
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            SizedBox(
              width: 340,
              height: 49,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(97, 67, 133, 1.0),
                        Color.fromRGBO(23, 0, 118, 1.0)
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    )),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        primary: Colors.transparent,
                        onPrimary: Colors.transparent),
                    child: const Text(
                      "CREATE CHANNEL",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}