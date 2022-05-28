import 'package:flutter/material.dart';
import 'package:rune/Infrastrucure/network_states.dart';

class NetworkProgress extends StatelessWidget {
  final NetworkState state;

  const NetworkProgress({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (state is Failure) {
      final snackBar = SnackBar(content: Text(state.data.toString()));
      Future.delayed(Duration.zero, () async {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }

    if (state is Sent) {
      return const CircularProgressIndicator();
    }

    return Container();
  }
}
