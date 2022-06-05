import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rune/presentation/auth/login_screen.dart';
import 'package:rune/presentation/auth/widgets/auth_button.dart';
import 'package:rune/presentation/auth/widgets/auth_inputs.dart';

void main() {
  testWidgets('Log in page contains two input fields with one button',
      (WidgetTester tester) async {
    await tester.pumpWidget(SignInScreen());

    final authInputCount = find.byType(AuthInput);

    final passwordInputCount = find.byType(PasswordInput);

    final authButtonCount = find.byType(AuthButton);

    expect(authInputCount, findsOneWidget);
    expect(passwordInputCount, findsOneWidget);
    expect(authButtonCount, findsOneWidget);
  });

  testWidgets('searching texts if they appear on the login screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(SignInScreen());

    final textSearch = find.text("Let's Sign you in.");

    final textSearch2 = find.text("Don't have an account? Register");

    expect(textSearch, findsOneWidget);

    expect(textSearch2, findsOneWidget);
  });

  // testWidgets('testing the login page', (tester) async {
  //   await tester.pumpWidget( SignInScreen());

  //   await tester.enterText(find.byType(AuthInput), "example@example.com");
  //   expect(find.text('example@example.com'), findsOneWidget);

  //   await tester.enterText(find.byType(PasswordInput), "12345678");
  //   expect(find.text('12345678'), findsOneWidget);

  //   await tester.tap(find.byType(AuthButton));
  //   await tester.pump();

  // });
}
