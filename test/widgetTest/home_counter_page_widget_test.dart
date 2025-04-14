import 'package:counter_widget_testing/widgetTest/home_counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Home Counter Page Widget Test - ', () {
    /// testinng FAB Buttons which increments counter by 1,
    /// decrements counter by 1 and resets
    testWidgets(
      'given the HomeCounterWidgetPage when FloatingActionButton(FAB Button) is clicked then then respective counter functions are called',
      (tester) async {
        /// pumping the HomeCounterWidgetPage widget into the widget tree
        await tester.pumpWidget(MaterialApp(home: HomeCounterWidgetPage()));

        /// test to check the page appbar
        final appbar = find.byType(AppBar);
        expect(appbar, findsOneWidget);

        /// iniatially gettin the counter text
        /// test to check initial value of the counter is 0 test
        final counterText = find.text('0');
        expect(counterText, findsOneWidget);

        /// test to check the counter value is incremented by 1 by tapping the FAB button
        /// out of the 3 FAB buttons, the first one is used to increment the counter value
        /// and is targeted by using ".first" method
        final fabButtonIncrement = find.byType(FloatingActionButton).first;
        await tester.tap(fabButtonIncrement);

        /// pumping the widget tree to reflect the changes, it is similar to setState
        /// in the StatefulWidget. if "Pump" is not called then the changes will not be reflected
        /// in the widget tree and the test will fail
        await tester.pump();

        /// gettin the counter text again and
        /// test to check the counter value is incremented by 1
        final counterText1 = find.text('1');
        expect(counterText1, findsOneWidget);

        /// test to check the counter value is decremented by 1 by tapping the FAB button
        /// out of the 3 FAB buttons, the second one is used to decrement the counter value
        /// and is targeted by using ".key" method which is used as a unique identifier of the widget
        final fabButtonReset = find.byKey(Key('fabResetButton'));
        await tester.tap(fabButtonReset);

        /// pumping the widget tree to reflect the changes, it is similar to setState
        await tester.pump();

        /// gettin the counter text again and
        /// test to check the counter value is decremented by 1
        final counterText2 = find.text('0');
        expect(counterText2, findsOneWidget);

        /// test to check the counter value is resetto 0 by tapping the FAB button
        /// out of the 3 FAB buttons, the last one is used to reset the counter value
        /// and is targeted by using "at(index)" method where indez ranges from 0 to 2(numOfWidget-1)
        final fabButtonDecrement = find.byType(FloatingActionButton).at(2);
        await tester.tap(fabButtonDecrement);

        /// pumping the widget tree to reflect the changes, it is similar to setState
        await tester.pump();

        /// gettin the counter text again and
        /// test to check the counter value is reset to 0
        final counterText3 = find.text('-1');
        expect(counterText3, findsOneWidget);
      },
    );

    /// testinng Elevated Buttons which increments counter by 2,
    /// decrements counter by 2 and resets
    testWidgets(
      'givennn the HomeCounterWidgetPage when ElevatedButton is clicked then then respective functions are called',
      (tester) async {
        /// pumping the HomeCounterWidgetPage widget into the widget tree
        await tester.pumpWidget(MaterialApp(home: HomeCounterWidgetPage()));

        /// test to check on tap of elevated button and is targets by "at(index)" method
        /// then the counter value is reset to 0
        final elevButton1 = find.byType(ElevatedButton).at(1);
        await tester.tap(elevButton1);

        /// pumping the widget tree to reflect the changes, it is similar to setState
        await tester.pump();

        /// gettin the counter text again and
        /// test to check the counter value is reset to 0
        final counterElev1 = find.text('0');
        expect(counterElev1, findsOneWidget);

        /// test to check on tap of elevated button and is targets by "key" method
        /// then the counter value is incremented by 2
        /// and is targeted by using ".key" method which is used as a unique identifier of the widget
        final elevButton2 = find.byKey(Key('elevIncrementButton'));
        await tester.tap(elevButton2);

        /// pumping the widget tree to reflect the changes, it is similar to setState
        await tester.pump();

        /// gettin the counter text again and
        /// test to check the counter value is incremented by 2
        final counterElev2 = find.text('2');
        expect(counterElev2, findsOneWidget);

        /// test to check on tap of elevated button and is targets by "first" method
        /// then the counter value is decremented by 2
        final elevButton3 = find.byType(ElevatedButton).first;
        await tester.tap(elevButton3);

        /// pumping the widget tree to reflect the changes, it is similar to setState
        await tester.pump();

        /// gettin the counter text again and
        /// test to check the counter value is decremented by 2
        final counterElev3 = find.text('0');
        expect(counterElev3, findsOneWidget);
      },
    );
  });
}
