import 'package:demo/src/core/arch/view_model.dart';
import 'package:demo/src/services/spacex/models/launch.dart';
import 'package:demo/src/ui/pages/spacex/sheet/sheet.dart';
import 'package:flutter/material.dart';

class SpaceXLaunchInfoSheetViewModel extends ViewModel<SpaceXLaunchInfoSheet> {

  final ValueNotifier<String> launchName;

  final ValueNotifier<Color> backgroundColor = ValueNotifier( Colors.grey.withOpacity( 0.95 ) );

  final ValueNotifier<String> rocketName;
  final ValueNotifier<String> rocketNameLabel = ValueNotifier( 'Rocket: ' );

  final ValueNotifier<String> company;
  final ValueNotifier<String> companyLabel = ValueNotifier( 'Company: ' );

  final ValueNotifier<String> missionIds;
  final ValueNotifier<String> missionIdLabel = ValueNotifier( 'Mission IDs: ' );

  SpaceXLaunchInfoSheetViewModel( SpaceXLaunch launch ) :
        launchName = ValueNotifier( launch.name ),
        company = ValueNotifier( launch.launchRocket.rocket.company ),
        missionIds = ValueNotifier( launch.missionId.join(', ') ),
        rocketName = ValueNotifier( launch.launchRocket.name );

}