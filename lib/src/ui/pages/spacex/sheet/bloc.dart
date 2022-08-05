import 'package:demo/src/core/arch/bloc.dart';
import 'package:demo/src/ui/pages/spacex/sheet/sheet.dart';
import 'package:demo/src/ui/pages/spacex/sheet/view_model.dart';

class SpaceXLaunchInfoSheetBloc extends Bloc<SpaceXLaunchInfoSheet> {

  final SpaceXLaunchInfoSheetViewModel _viewModel;

  SpaceXLaunchInfoSheetBloc( this._viewModel );

  Future<void> init() async {

  }

}