import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:counter_widget_testing/main.dart' as app;

main() {
  /// creates and initializes the integration test binding
  /// and sets up the test environment for integration testing.
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  /// grouping the tests for better organization and readability.
  group('Testing Login Feature of User', () {
    /// tests for correct user credentials i.e username and password
    /// and checks if the user is navigated to the home page.
    /// This test checks if the login page is displayed correctly
    testWidgets(
      'given login page, when CORRECT Username and Password are provided then show SUCCESS DIALOG.',
      (tester) async {
        /// launches the app.
        app.main();

        /// waits for the app to settle.
        await tester.pumpAndSettle();

        /// taps the login button to navigate to the login page.
        await tester.tap(find.byType(ElevatedButton).last);

        /// waits for the app to settle.
        await tester.pumpAndSettle();

        /// enters the correct email into the text fields.
        /// the email is entered into the first text field.
        final emailTextField = find.byType(TextFormField).at(0);
        await tester.enterText(emailTextField, 'testmail');

        /// enters the correct password into the text fields.
        /// the password is entered into the second text field.
        final pwdTextField = find.byType(TextFormField).at(1);
        await tester.enterText(pwdTextField, 'testpassword');

        /// taps the login button to submit the form.
        await tester.tap(find.byType(ElevatedButton));

        /// waits for the app to settle.
        await tester.pumpAndSettle();

        /// checks if the AlertDialog is displayed.
        /// the AlertDialog is displayed when the user is successfully logged in.
        expect(find.byType(AlertDialog), findsOneWidget);
      },
    );

    /// test for incorrect user credentials i.e username and password
    /// and checks if the user is shown a snackbar with error message.
    testWidgets(
      'given login page, when IN-CORRECT Username and Password are provided then show SNACKBAR.',
      (tester) async {
        /// launches the app.
        app.main();

        /// waits for the app to settle.
        await tester.pumpAndSettle();

        /// taps the login button to navigate to the login page.
        await tester.tap(find.byType(ElevatedButton).last);

        /// waits for the app to settle.
        await tester.pumpAndSettle();

        /// enters the in-correct email into the text fields.
        /// the email is entered into the first text field.
        final emailTextField = find.byType(TextFormField).at(0);
        await tester.enterText(emailTextField, 'testwrongmail');

        /// enters the in-correct password into the text fields.
        /// the password is entered into the second text field.
        final pwdTextField = find.byType(TextFormField).at(1);
        await tester.enterText(pwdTextField, 'testwrongpassword');

        /// taps the login button to submit the form.
        await tester.tap(find.byType(ElevatedButton));

        /// waits for the app to settle.
        await tester.pumpAndSettle();

        /// checks if the AlertDialog is displayed.
        /// the AlertDialog is displayed when the user is successfully logged in.
        expect(find.byType(SnackBar), findsOneWidget);
      },
    );
  });
}
