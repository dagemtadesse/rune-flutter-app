import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../models/providers/page_model.dart';
import '../routes/routes.dart';
import '../theme.dart';

class ChannelCard extends StatelessWidget {
  final Channel channel;
  const ChannelCard(this.channel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageModel = Provider.of<PageModel>(context, listen: false);

    return GestureDetector(
      onTap: () {
        pageModel.setCurrentPage(Pages.channelPage);
      },
      child: Card(
        elevation: 1,
        margin: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
              color: Color.fromRGBO(206, 206, 206, 1), width: 1),
          borderRadius: BorderRadius.circular(12.0),
          // bo
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12.0),
                      topLeft: Radius.circular(12.0)),
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(19, 106, 138, 1),
                    Color.fromRGBO(38, 120, 113, 1),
                  ])),
              child: Column(
                children: [
                  if (channel.logoImageUrl != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "http://localhost:9999/${channel.logoImageUrl}"),
                        radius: 46,
                      ),
                    ),
                  if (channel.logoImageUrl == null)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/mechanical.jpg"),
                        radius: 46,
                      ),
                    ),
                  Text(
                    channel.name,
                    style: GoogleFonts.poppins(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10)
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                channel.description,
                style: GoogleFonts.poppins(
                    fontSize: 15.0,
                    color: RuneTheme.borderColor,
                    fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
    );
  }
}
//  Widget channelCard(BuildContext context) {
//     
//   }
  