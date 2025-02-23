import 'package:converter/components/appbar.dart';
import 'package:converter/components/buttons.dart';
import 'package:converter/components/text_fields.dart';
import 'package:converter/screens/token/buildvu_token_screen.dart';
import 'package:converter/themes/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

Widget createHomeScreen() {
  return ProviderScope(
      child: MaterialApp(
    home: BuildvuTokenScreen(),
  ));
}

void main() {
  group('BuildVu token screen widget test', () {
    testWidgets('test if appbar shows up', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(StyledAppbar), findsOneWidget);
    });

    testWidgets('test if heading shows up', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.text('Token'), findsOneWidget);
    });

    testWidgets('test if token text field shows up', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(TokenTextField), findsOneWidget);
    });

    testWidgets('test if token instructions show up', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(StyledTitleBuildVu), findsWidgets);
      expect(find.byType(StyledText), findsWidgets);
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('test if continue btn shows up', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(ColorfulBgBtn), findsOneWidget);
    });

    testWidgets(
        'test if clicking on continue btn without putting in token, snackbar shows up',
        (tester) async {
      await tester.pumpWidget(createHomeScreen());
      await tester.tap(find.byType(ColorfulBgBtn));
      expect(find.byType(ScaffoldMessenger), findsOneWidget);
    });

    testWidgets(
        'test if filling out token text field then clicking on continue btn will not trigger snackbar',
        (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(TokenTextField), findsOneWidget);
      await tester.enterText(find.byType(TokenTextField), 'a');
      await tester.pumpAndSettle();
      await tester.tap(find.byType(ColorfulBgBtn));
      expect(find.byType(SnackBar), findsNothing);
    });
  });
}
