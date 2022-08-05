

import 'dart:async';

import 'package:demo/src/core/arch/bloc_provider.dart';
import 'package:flutter/material.dart';
typedef WatchNotifier<T> = void Function( T? );

class Bloc<T extends Widget> {

  /// Keep track and cancel on dispose.
  final Map<String, StreamSubscription> _subscriptions = {};

  static T of<T extends Bloc>( BuildContext context, { bool listen = true } ) {
    final BlocProvider<T>? result = () {
      if ( listen ) {
        return context.dependOnInheritedWidgetOfExactType<BlocProvider<T>>();
      } else {
        return context.findAncestorWidgetOfExactType<BlocProvider<T>>();
      }
    }();

    assert(result != null, 'No Bloc for $T found in context');
    return result!.bloc;
  }

  @mustCallSuper
  Future<void> dispose() async {
    for ( var sub in _subscriptions.values ) {
      await sub.cancel();
    }

    _subscriptions.clear();
  }

  Future<void> unwatch( String key ) async {
    await _subscriptions[ key ]?.cancel();
    _subscriptions.remove( key );
  }

  void subscribe<V>( { required Stream<V> stream, required Function(V event) onData } ) {
    _subscriptions[ '${T}_${DateTime.now().millisecondsSinceEpoch}' ] = stream.listen( onData );
  }

}