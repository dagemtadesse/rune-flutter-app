import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rune/models/providers/login_form.dart';
import 'package:rune/routes/routes.dart';

void main() {
  runApp(const RuneApp());
}

class RuneApp extends StatelessWidget {
  const RuneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginFormModel>(
          create: (_) => LoginFormModel(),
        ),
      ],
      child: MaterialApp(
        home: Navigator(
          pages: const [
            MaterialPage(
              key: ValueKey("splash page"),
              child: Splash(),
            ),
          ],
          onPopPage: (route, result) => route.didPop(result),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
