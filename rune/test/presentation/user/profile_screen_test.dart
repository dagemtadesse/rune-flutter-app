import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rune/presentation/user/profile_screen.dart';

void  main() {
  
  testWidgets('profile screen page contains six List tile and one circle avatar',
      (WidgetTester tester) async {
    await tester.pumpWidget(ProfileScreen());

    final listTileCount = find.byType(ListTile);
    expect(listTileCount, findsNWidgets(6));

    final avatarCount = find.byType(CircleAvatar);
    expect(avatarCount, findsOneWidget);

  });


  
}