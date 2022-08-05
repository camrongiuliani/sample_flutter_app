import 'package:demo/src/core/arch/bloc.dart';
import 'package:demo/src/ui/pages/spacex/list/page.dart';
import 'package:demo/src/ui/pages/spacex/list_item/view_model.dart';
import 'package:flutter/animation.dart';

class SpaceXListItemBloc extends Bloc<SpaceXPage> {

  final SpaceXListItemViewModel _viewModel;

  SpaceXListItemBloc( this._viewModel );

  TickerFuture? toggleDetail() {
    _viewModel.showingDetail.value = ! _viewModel.showingDetail.value;

    if ( _viewModel.showingDetail.value ) {
      return _viewModel.detailController?.forward();
    } else {
      return _viewModel.detailController?.reverse();
    }
  }

}