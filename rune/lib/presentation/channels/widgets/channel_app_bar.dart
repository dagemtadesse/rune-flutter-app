import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rune/domain/models.dart';

class ChannelAppBar extends StatefulWidget {
  final Channel channel;

  const ChannelAppBar({Key? key, required this.channel}) : super(key: key);

  @override
  State<ChannelAppBar> createState() => _ChannelAppBarState();
}

class _ChannelAppBarState extends State<ChannelAppBar> {
  bool _pinned = false;

  @override
  void initState() {
    super.initState();
    _pinned = widget.channel.pinned;
  }

  @override
  Widget build(BuildContext context) {
    final background = (widget.channel.logo != null)
        ? NetworkImage(widget.channel.logo!)
        : const AssetImage("assets/mechanical.jpg");

    return Stack(
      children: [
        Container(
          constraints:
              const BoxConstraints.expand(height: 260, width: double.infinity),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: background as ImageProvider, fit: BoxFit.cover),
          ),
        ),
        /////
        Container(
          constraints: const BoxConstraints.expand(
            height: 260,
            width: double.infinity,
          ),
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  IconButton(
                    onPressed: () async {
                      // setState(() {
                      //   _pinned = !_pinned;
                      // });
                      // Provider.of<PageModel>(context, listen: false).updateUi();
                    },
                    icon: Icon(!_pinned
                        ? Icons.bookmark_add_outlined
                        : Icons.bookmark),
                    color: Colors.white,
                  ),
                  const SizedBox(width: 18),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Text(
                        widget.channel.name,
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Text(
                        widget.channel.description,
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 15.0),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                        ),
                      ),
                      constraints: const BoxConstraints.expand(height: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
