import 'package:demo/src/core/arch/view_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

abstract class ViewModel<T extends Widget> extends SafeChangeNotifier {

  static T of<T extends ViewModel>( BuildContext context, { bool listen = true } ) {
    final ViewModelProvider<T>? result = () {
      if ( listen ) {
        return context.dependOnInheritedWidgetOfExactType<ViewModelProvider<T>>();
      } else {
        return context.findAncestorWidgetOfExactType<ViewModelProvider<T>>();
      }
    }();

    assert(result != null, 'No ViewModel for $T found in context');
    return result!.viewModel;
  }

}