import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rune/application/channel/bloc/channel_bloc.dart';
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
          BlocProvider<ChannelBloc>(create: (_) => ChannelBloc()),
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
    final navCubit = context.read<NavigationCubit>();
    final userRepo = RepositoryProvider.of<UserRepository>(context);

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
            if (state is RegisterRoute)
              MaterialPage(
                key: const ValueKey('sign up page'),
                child: SignUpScreen(),
              ),
            if (state is LoginRoute)
              MaterialPage(
                key: const ValueKey('sign in'),
                child: SignInScreen(),
              ),
            // // tier 3
            if (state is DashboardRoute)
              MaterialPage(
                key: const ValueKey('home page'),
                child: HostPage(state.tabIndex),
              ),
            // // tier 4
            if (state is ChangePasswordRoute)
              const MaterialPage(
                key: ValueKey('change password page'),
                child: ChangePasswordScreen(),
              ),
            if (state is EditProfileRoute)
              const MaterialPage(
                key: ValueKey('edit profile page'),
                child: EditProfileScreen(),
              ),
            // // tier 5
            if (state is ChannelRoute)
              const MaterialPage(
                key: ValueKey('channel details page'),
                child: ChannelDetailsPage(),
              ),
            if (state is CreateChannelRoute)
              const MaterialPage(
                key: ValueKey('channel details page'),
                child: CreateChannelPage(),
              ),
            // // tier 7
          ],
          onPopPage: (route, result) {
            if (!route.didPop(result)) {
              return false;
            }
            switch (state.runtimeType) {
              case ChangePasswordRoute:
              case BookmarksRoute:
              case PostsRoute:
              case CommentsRoute:
              case EditProfileRoute:
                navCubit.toDashboardScreen(userRepo.loggedInUser!, 1);
                break;
            }
            return true;
          },
        ),
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
