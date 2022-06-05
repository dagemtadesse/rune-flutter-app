import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rune/domain/models.dart';
import 'package:rune/presentation/post/post_form.dart';
import 'package:rune/presentation/post/widgets/post_input.dart';

void main() {
  testWidgets('Finding and verifying Widgets in Post Form page',
      (WidgetTester tester) async {
    final myChannel = Channel(
        id: 0,
        authorId: 0,
        name: 'Dagem',
        description: 'description',
        verified: false,
        updatedAt: DateTime.now(),
        pinned: false);

    await tester.pumpWidget(PostForm(
        formKey: GlobalKey<FormState>(),
        titleController: TextEditingController(),
        contentController: TextEditingController(),
        channel: myChannel));

    final containerWidgetCount = find.byType(Container);
    final scrollerWidgetCount = find.byType(SingleChildScrollView);

    final formWidgetCount = find.byType(Form);
    final inputFiedCount = find.byType(PostInput);

    final dividerWidgetCount = find.byType(Divider);

    expect(containerWidgetCount, findsOneWidget);
    expect(scrollerWidgetCount, findsOneWidget);

    expect(formWidgetCount, findsOneWidget);
    expect(inputFiedCount, findsNWidgets(2));

    expect(dividerWidgetCount, findsOneWidget);
  });
}
