import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rune/presentation/user/widgets/underlined_input.dart';
import 'package:rune/presentation/user/edit_profile_screen.dart';

void main() {
  testWidgets('Edit profile screen page contains three UnderlinedInput fields',
      (WidgetTester tester) async {
    await tester.pumpWidget(EditProfileScreen());
    final inputFieldsCount = find.byType(UnderlinedInput);
    expect(inputFieldsCount, findsNWidgets(3));
  });

  testWidgets('Edit profile screen page contains 1 circle avatar and 1 Text ',
      (WidgetTester tester) async {
    await tester.pumpWidget(EditProfileScreen());

    final avatarCount = find.byType(CircleAvatar);
    expect(avatarCount, findsOneWidget);

    final textWidgetCount = find.byType(Text);
    expect(textWidgetCount, findsOneWidget);
  });
}
