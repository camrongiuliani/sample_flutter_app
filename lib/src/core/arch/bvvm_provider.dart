import 'package:demo/src/core/arch/bloc.dart';
import 'package:demo/src/core/arch/bloc_provider.dart';
import 'package:demo/src/core/arch/view_model.dart';
import 'package:demo/src/core/arch/view_model_provider.dart';
import 'package:flutter/widgets.dart';

class BVVMProvider< V extends ViewModel, B extends Bloc > extends InheritedWidget {

  final V viewModel;
  final B bloc;

  const BVVMProvider( {
    required this.viewModel,
    required this.bloc,
    required super.child,
    super.key,
  } );

  static BVVMProvider<V, B> create< V extends ViewModel, B extends Bloc >({
    required V viewModel,
    required B bloc,
    required Widget child,
  }) {
    return BVVMProvider(
      viewModel: viewModel,
      bloc: bloc,
      child: ViewModelProvider<V>(
        viewModel: viewModel,
        child: BlocProvider<B>(
          bloc: bloc,
          child: child,
        ),
      ),
    );
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}