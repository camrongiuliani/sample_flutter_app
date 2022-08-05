import 'package:demo/src/core/arch/bloc.dart';
import 'package:demo/src/services/spacex/spacex_service.dart';
import 'package:demo/src/ui/pages/spacex/list/page.dart';
import 'package:demo/src/ui/pages/spacex/list/view_model.dart';

class SpaceXBloc extends Bloc<SpaceXPage> {

  final SpaceXViewModel _viewModel;

  SpaceXBloc( this._viewModel );

  Future<void> init() async {
    loadLaunches();
  }

  Future<void> loadLaunches() {
    return SpaceXService().getLaunches().then( ( result ) {
      if ( result.success ) {
        _viewModel.launches.value = result.data ?? [];
      }
    });
  }

}