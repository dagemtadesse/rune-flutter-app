import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rune/models/network/network_states.dart';
import 'package:rune/models/providers/page_model.dart';
import 'package:rune/models/providers/provider.dart';
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
        ChangeNotifierProvider<RegistrationFromModel>(
          create: (_) => RegistrationFromModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => PageModel(),
        ),
      ],
      child: const RunePages(),
    );
  }
}

class RunePages extends StatelessWidget {
  const RunePages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageModel = Provider.of<PageModel>(context);
    final registrationModel = Provider.of<RegistrationFromModel>(context);
    final signInModel = Provider.of<LoginFormModel>(context);

    return MaterialApp(
      home: Navigator(
        pages: [
          const MaterialPage(
            key: ValueKey("splash page"),
            child: SplashScreen(),
          ),
          if (pageModel.currentPage == Pages.SIGN_IN_PAGE)
            const MaterialPage(
              key: ValueKey('sign up page'),
              child: SignUpScreen(),
            ),
          if (pageModel.currentPage == Pages.SIGN_IN_PAGE ||
              registrationModel.signInRequestState is Received)
            const MaterialPage(
              key: ValueKey('sign in'),
              child: SignInScreen(),
            ),
          if (signInModel.loginRequestState is Received)
            const MaterialPage(
              key: ValueKey('home page'),
              child: HostPage(),
            ),
        ],
        onPopPage: (route, result) => route.didPop(result),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
