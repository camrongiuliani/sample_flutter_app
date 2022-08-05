import 'package:demo/src/core/arch/bloc.dart';
import 'package:demo/src/core/arch/bvvm_provider.dart';
import 'package:demo/src/core/arch/view_model.dart';
import 'package:flutter/widgets.dart' hide Router;
import 'package:flutter_test/flutter_test.dart';

class FakeViewModel extends ViewModel {
  final ValueKey<int> key;
  FakeViewModel( { required this.key });
}

class FakeBloc extends Bloc {
  final ValueKey<int> key;
  FakeBloc( { required this.key });
}

void main() {

  group( 'BVVMProvider Tests', () {

    testWidgets('BVVMProvider Update Should Notify Test', (tester) async {
      await tester.pumpWidget(
        BVVMProvider.create<FakeViewModel, FakeBloc>(
          viewModel: FakeViewModel(
            key: const ValueKey( 1 ),
          ),
          bloc: FakeBloc(
            key: const ValueKey( 1 ),
          ),
          child: Container(),
        ),
      );

      var e = tester.element( find.byType( BVVMProvider<FakeViewModel, FakeBloc> ) );
      expect( e.widget, isA<BVVMProvider<FakeViewModel, FakeBloc>>() );
      var ap = e.widget as BVVMProvider<FakeViewModel, FakeBloc>;

      expect( ap.updateShouldNotify( ap ), isFalse );
    });

    testWidgets('BVVMProvider Provides ViewModel Test', (tester) async {

      await tester.pumpWidget(
        BVVMProvider.create<FakeViewModel, FakeBloc>(
          viewModel: FakeViewModel(
            key: const ValueKey( 1 ),
          ),
          bloc: FakeBloc(
            key: const ValueKey( 1 ),
          ),
          child: Container(),
        ),
      );

      expect(
        () => ViewModel.of<FakeViewModel>(tester.element(find.byType(Container))),
        returnsNormally,
        reason: 'ViewModel.of should return normally.',
      );

    });

    testWidgets('BVVMProvider Provides Bloc Test', (tester) async {

      await tester.pumpWidget(
        BVVMProvider.create<FakeViewModel, FakeBloc>(
          viewModel: FakeViewModel(
            key: const ValueKey( 1 ),
          ),
          bloc: FakeBloc(
            key: const ValueKey( 1 ),
          ),
          child: Container(),
        ),
      );

      expect(
        () => Bloc.of<FakeBloc>(tester.element(find.byType(Container))),
        returnsNormally,
        reason: 'Bloc.of should return normally.',
      );
    });
  });
}