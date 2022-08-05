import 'package:demo/src/core/arch/view_model.dart';
import 'package:demo/src/services/spacex/models/launch.dart';
import 'package:demo/src/ui/pages/spacex/list/page.dart';
import 'package:flutter/material.dart';

class SpaceXViewModel extends ViewModel<SpaceXPage> {

  final ValueNotifier<List<SpaceXLaunch>> launches = ValueNotifier( [] );

}