import 'package:flutter/material.dart';

import '../../../models/mychannels_model.dart';  
  
  
  
  
Expanded buildCard() {
    return Expanded(
            child: GridView.builder(
              itemCount: channels.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 1.2
              ),
              itemBuilder: (context, index)=>ChannelCard(channel: channels[index],press: (){},)
            ),
            
          );
}


class ChannelCard extends StatelessWidget {
  final Channel channel;
  final Function press;
  const ChannelCard({
    Key? key, required this.channel, required this.press
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 1,
        child: InkWell(
          onTap: (){},
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 125,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: channel.color
                    ),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                         Align(
                           alignment: Alignment.topRight,
                           child: IconButton(
                             icon:ImageIcon(AssetImage("assets/icons/settings_icon.png")),
                             color: Colors.white,
                             onPressed: (){},
                             ),
                             
                           ),
                         CircleAvatar(
                          backgroundImage:AssetImage(channel.image),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            channel.channelName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          ),
                        )
                      ],
                    ),
                  ),           
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      channel.description,
                      style: const TextStyle(
                        color:Color.fromRGBO(89, 89, 89, 1)
                      ),
                      ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                          fontSize: 17,
                          color: Color.fromRGBO(154, 140, 152, 1)),
                      ),
                      onPressed: (){},
                      child: const Text('JOIN'),
                    ),
        
                  ]
                  ),
        
              ),
        
            ],
          ),
        ),
      ),
    );
  }

}