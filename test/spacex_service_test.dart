

import 'dart:async';

import 'package:demo/src/services/spacex/spacex_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  late final String httpLink;
  late final SpaceXService service;

  setUp( () {
    httpLink = "https://api.spacex.land/graphql/";
  });

  test( 'Test SpaceXService', () async {

    expect( () => SpaceXService(), throwsAssertionError );

    expect( () => service = SpaceXService( httpLink ), returnsNormally );

    await expectLater( service.getLaunches(), completion( isNot( throwsException ) ) );

  });

}