import 'dart:math';
import 'package:demo/src/core/arch/view_model.dart';
import 'package:demo/src/services/spacex/models/launch.dart';
import 'package:demo/src/ui/pages/spacex/list_item/item.dart';
import 'package:flutter/material.dart';

class SpaceXListItemViewModel extends ViewModel<SpaceXListItem> {

  final ValueNotifier<bool> showingDetail = ValueNotifier( false );
  final ValueNotifier<Color> backgroundColor = ValueNotifier( Colors.white.withOpacity( 0.8 ) );
  final ValueNotifier<Color> detailBackgroundColor = ValueNotifier( Colors.grey.withOpacity( 0.7 ) );

  final Animatable<double> easeInTween = CurveTween( curve: Curves.easeInOut );
  final Duration kExpand = const Duration( milliseconds: 200 );

  Animation<double>? detailHeightFactor;
  AnimationController? detailController;

  final ValueNotifier<SpaceXLaunch> launch;
  final ValueNotifier<String> launchName;
  final ValueNotifier<String?> launchDetails;

  bool get hasLaunchDetails => launchDetails.value?.isNotEmpty == true;

  IconData get dropdownIcon => showingDetail.value ? Icons.rocket_launch : Icons.rocket;

  double get dropdownIconAngle {
    if ( showingDetail.value ) {
      return 0.0;
    }

    return 180 * pi / 180;
  }

  Color get dropdownIconColor => showingDetail.value ? Colors.green : Colors.black;

  SpaceXListItemViewModel( SpaceXLaunch launch ) :
        launch = ValueNotifier( launch ),
        launchName = ValueNotifier( launch.name ),
        launchDetails = ValueNotifier( launch.details );
}