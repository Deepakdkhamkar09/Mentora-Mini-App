import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_task/main.dart';

void main() {
  testWidgets('App loads and shows login screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MentoraApp());

    // Verify that the login screen title is present.
    expect(find.textContaining('Welcome to'), findsOneWidget);
    expect(find.text('Login'), findsWidgets);
  });
}
