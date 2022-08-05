import 'package:demo/src/services/spacex/spacex_service.dart';
import 'package:demo/src/ui/pages/spacex/list/bloc.dart';
import 'package:demo/src/ui/pages/spacex/list/page.dart';
import 'package:demo/src/ui/pages/spacex/list/view_model.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SpaceXService( "https://api.spacex.land/graphql/" );

  runApp(
    MaterialApp(
      home: () {
        SpaceXViewModel viewModel = SpaceXViewModel();
        SpaceXBloc bloc = SpaceXBloc( viewModel );
        return SpaceXPage.create( viewModel: viewModel, bloc: bloc );
      }(),
    )
  );
}