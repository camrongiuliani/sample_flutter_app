
import 'package:demo/src/core/arch/bloc.dart';
import 'package:demo/src/core/arch/bloc_provider.dart';
import 'package:flutter/widgets.dart' hide Router;
import 'package:flutter_test/flutter_test.dart';

class FakeBloc extends Bloc {
  final ValueKey<int> key;
  FakeBloc( { required this.key });
}

void main() {

  group( 'BlocProvider Tests', () {

    testWidgets('Bloc Provider Update Should Notify Test', (tester) async {
      await tester.pumpWidget(
        BlocProvider<FakeBloc>(
          bloc: FakeBloc(
            key: const ValueKey( 1 ),
          ),
          child: Container(),
        ),
      );

      var e = tester.element( find.byType( BlocProvider<FakeBloc> ) );
      expect( e.widget, isA<BlocProvider>() );
      var ap = e.widget as BlocProvider;

      expect( ap.updateShouldNotify( ap ), isFalse );
    });

    testWidgets('Bloc Provider Bloc Exists Up Test', (tester) async {

      await tester.pumpWidget(
        BlocProvider(
          bloc: FakeBloc(
            key: const ValueKey( 1 ),
          ),
          child: Container(),
        ),
      );

      expect(
            () => Bloc.of<FakeBloc>(tester.element(find.byType(Container))),
        isNotNull,
        reason: 'Bloc should not be null.',
      );

      expect(
            () => Bloc.of<FakeBloc>(tester.element(find.byType(Container)), listen: false),
        isNotNull,
        reason: 'Bloc should not be null.',
      );
    });
  });
}