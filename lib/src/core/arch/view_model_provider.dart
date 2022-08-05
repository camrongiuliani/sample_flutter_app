import 'package:demo/src/core/arch/view_model.dart';
import 'package:flutter/widgets.dart';

class ViewModelProvider< T extends ViewModel > extends InheritedWidget {

  final T viewModel;

  const ViewModelProvider( {
    required this.viewModel,
    required super.child,
    super.key,
  } );

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}