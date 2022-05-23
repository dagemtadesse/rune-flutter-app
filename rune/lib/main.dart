import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rune/models/network/network_states.dart';
import 'package:rune/models/providers/provider.dart';
import 'package:rune/routes/create_channel_page.dart';
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
        ChangeNotifierProvider<Repository>(
            create: (_) => Repository()
              ..authenticationKey =
                  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjM2LCJpYXQiOjE2NTI5ODE1MzYzMjMsImV4cCI6MTY1Mjk4MjE0MTEyM30.gOcMLIB1YndO8pPtVOZyNRkioKqRJlUVnUviaMMDhL4"),
        ChangeNotifierProvider<LoginFormModel>(
          create: (_) => LoginFormModel(),
        ),
        ChangeNotifierProvider<RegistrationFromModel>(
          create: (_) => RegistrationFromModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => ChangePasswordFormModel(),
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
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.black,
        ),
      ),
      home: Navigator(
        pages: [
          // tier 1
          const MaterialPage(
            key: ValueKey("splash page"),
            child: SplashScreen(),
          ),
          // tier 2
          if (pageModel.currentPage == Pages.signInPage)
            const MaterialPage(
              key: ValueKey('sign up page'),
              child: SignUpScreen(),
            ),
          if (pageModel.currentPage == Pages.signInPage ||
              registrationModel.signInRequestState is Received)
            const MaterialPage(
              key: ValueKey('sign in'),
              child: SignInScreen(),
            ),
          // tier 3
          if (signInModel.loginRequestState is Received)
            const MaterialPage(
              key: ValueKey('home page'),
              child: HostPage(),
            ),
          // tier 4
          if (pageModel.currentPage == Pages.changePasswordPage)
            const MaterialPage(
              key: ValueKey('change password page'),
              child: ChangePasswordScreen(),
            ),
          if (pageModel.currentPage == Pages.editProfilePage)
            const MaterialPage(
              key: ValueKey('edit profile page'),
              child: EditProfileScreen(),
            ),
          // tier 5
          if (pageModel.currentPage == Pages.channelPage)
            MaterialPage(
              key: ValueKey('channel details page'),
              child: ChannelDetailsPage(
                context: context,
              ),
            ),
          if (pageModel.currentPage == Pages.createChannelPage)
            const MaterialPage(
              key: ValueKey('channel details page'),
              child: CreateChannelPage(),
            ),
          MaterialPage(
            key: ValueKey('channel details page'),
            child: ChannelDetailsPage(context: context),
          ),
          // tier 7
        ],
        onPopPage: (route, result) => route.didPop(result),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
