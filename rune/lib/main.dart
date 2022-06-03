import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rune/application/navigation/navigation_cubit.dart';
import 'package:rune/infrastructure/repositories.dart';
import 'package:rune/presentation/screens.dart';

import 'domain/page_model.dart';

void main() {
  runApp(const RuneApp());
}

class RuneApp extends StatelessWidget {
  const RuneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => UserRepository()),
        RepositoryProvider(create: (_) => ChannelRepository()),
        RepositoryProvider(create: (_) => PostRepository()),
        RepositoryProvider(create: (_) => CommentRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<NavigationCubit>(create: (_) => NavigationCubit()),
        ],
        child: const RunePages(),
      ),
    );
  }
}

class RunePages extends StatelessWidget {
  const RunePages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
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
            if (state is RegisterScreen)
              MaterialPage(
                key: const ValueKey('sign up page'),
                child: SignUpScreen(),
              ),
            if (state is LoginScreen)
              MaterialPage(
                key: const ValueKey('sign in'),
                child: SignInScreen(),
              ),
            // // tier 3
            if (state is DashboardScreen)
              const MaterialPage(
                key: ValueKey('home page'),
                child: HostPage(),
              ),
            // // tier 4
            // if (pageModel.currentPage == Pages.changePasswordPage)
            //   const MaterialPage(
            //     key: ValueKey('change password page'),
            //     child: ChangePasswordScreen(),
            //   ),
            // if (pageModel.currentPage == Pages.editProfilePage)
            //   const MaterialPage(
            //     key: ValueKey('edit profile page'),
            //     child: EditProfileScreen(),
            //   ),
            // // tier 5
            // if (pageModel.currentPage == Pages.channelPage)
            //   const MaterialPage(
            //     key: ValueKey('channel details page'),
            //     child: ChannelDetailsPage(),
            //   ),
            // if (pageModel.currentPage == Pages.createChannelPage)
            //   const MaterialPage(
            //     key: ValueKey('channel details page'),
            //     child: CreateChannelPage(),
            //   ),
            // // tier 7
          ],
          onPopPage: (route, result) => route.didPop(result),
        ),
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
