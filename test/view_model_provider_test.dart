
import 'package:demo/src/core/arch/view_model.dart';
import 'package:demo/src/core/arch/view_model_provider.dart';
import 'package:flutter/widgets.dart' hide Router;
import 'package:flutter_test/flutter_test.dart';

class FakeViewModel extends ViewModel {
  final ValueKey<int> key;
  FakeViewModel( { required this.key });
}

void main() {

  group( 'ViewModelProvider Tests', () {

    testWidgets('View Model Provider Update Should Notify Test', (tester) async {
      await tester.pumpWidget(
        ViewModelProvider<FakeViewModel>(
          viewModel: FakeViewModel(
            key: const ValueKey( 1 ),
          ),
          child: Container(),
        ),
      );

      var e = tester.element( find.byType( ViewModelProvider<FakeViewModel> ) );
      expect( e.widget, isA<ViewModelProvider<FakeViewModel>>() );
      var ap = e.widget as ViewModelProvider<FakeViewModel>;

      expect( ap.updateShouldNotify( ap ), isTrue );
    });

    testWidgets('View Model Provider Provides ViewModel Test', (tester) async {

      await tester.pumpWidget(
        ViewModelProvider<FakeViewModel>(
          viewModel: FakeViewModel(
            key: const ValueKey( 1 ),
          ),
          child: Container(),
        ),
      );

      expect(
        ViewModel.of<FakeViewModel>(tester.element(find.byType(Container))),
        isNotNull,
        reason: 'ViewModel should not be null.',
      );
    });
  });
}