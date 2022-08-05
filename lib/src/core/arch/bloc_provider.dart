import 'package:demo/src/core/arch/bloc.dart';
import 'package:flutter/widgets.dart';

class BlocProvider< T extends Bloc > extends InheritedWidget {

  final T bloc;

  const BlocProvider( {
    required this.bloc,
    required super.child,
    super.key,
  } );

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}