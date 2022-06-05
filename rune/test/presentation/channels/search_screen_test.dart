import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rune/presentation/channels/search_screen.dart';

void main(){
   testWidgets('Searching and verifying Widgets in Search screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(ChannelPage());

    final listViewWidgetFinder = find.byType(ListView);
    final pIndicatorFinder= find.byType(CircularProgressIndicator);

    expect(listViewWidgetFinder, findsOneWidget);
    expect(pIndicatorFinder, findsOneWidget);


  });
}