import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rune/Domain/authentication/authentication_form_validators/login_form.dart';
import 'package:rune/Infrastrucure/network_states.dart';

import 'package:rune/presentation/auth/auth.dart';
import 'package:rune/presentation/channels/channel.dart';
import 'package:rune/presentation/home/home_screen.dart';
import 'package:rune/presentation/splash/splash_screen.dart';
import 'package:rune/presentation/user/user.dart';

import 'Domain/authentication/authentication_models/change_password_form_model.dart';
import 'Domain/authentication/authentication_form_validators/register_form.dart';
import 'Domain/page_model.dart';

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
            const MaterialPage(
              key: ValueKey('channel details page'),
              child: ChannelDetailsPage(),
            ),
          if (pageModel.currentPage == Pages.createChannelPage)
            const MaterialPage(
              key: ValueKey('channel details page'),
              child: CreateChannelPage(),
            ),
          // tier 7
        ],
        onPopPage: (route, result) => route.didPop(result),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
