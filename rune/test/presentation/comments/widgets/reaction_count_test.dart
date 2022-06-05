import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rune/presentation/comments/widgets/reaction_count.dart';


void main() {
  testWidgets('Finding and verifying widgets in reaction_count ',
      (WidgetTester tester) async {

    await tester.pumpWidget(ReactionCount());
    final rowWidgetCount = find.byType(Row);

    final iconButtonCount = find.byType(Row);

    expect(rowWidgetCount, findsNWidgets(3));

    expect(iconButtonCount, findsNWidgets(2));



      });
}