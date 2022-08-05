import 'package:demo/src/services/spacex/models/launch.dart';
import 'package:flutter/material.dart';

class SpaceXDetail extends StatelessWidget {

  const SpaceXDetail({ super.key });

  @override
  Widget build(BuildContext context) {

    return ValueListenableBuilder<SpaceXLaunch?>(
      valueListenable: ValueNotifier(null),
      builder: ( ctx, val, wgt ) => Container(
        height: 150.0,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular( 8.0 ),
          color: Colors.blue,
        ),
        child: Row(
          children: [
            const Icon(Icons.rocket),
            Text( val == null ? 'error' : val.launchRocket.name ),
          ],
        ),
      ),
    );
  }
}
