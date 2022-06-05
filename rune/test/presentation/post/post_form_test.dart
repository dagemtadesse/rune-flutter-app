import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rune/presentation/post/post_form.dart';
import 'package:rune/presentation/post/widgets/post_input.dart';

void main(){
  testWidgets('Finding and verifying Widgets in Post Form page',
      (WidgetTester tester) async {
    await tester.pumpWidget(PostForm());

    final containerWidgetCount = find.byType(Container);
    final scrollerWidgetCount= find.byType(SingleChildScrollView);

    final formWidgetCount = find.byType(Form);
    final inputFiedCount= find.byType(PostInput);

    final dividerWidgetCount= find.byType(Divider);

    expect(containerWidgetCount, findsOneWidget);
    expect(scrollerWidgetCount, findsOneWidget);

    expect(formWidgetCount, findsOneWidget);
    expect(inputFiedCount, findsNWidgets(2));

    expect(dividerWidgetCount, findsOneWidget);




  });
}