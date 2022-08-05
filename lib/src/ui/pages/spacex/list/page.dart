import 'package:demo/src/core/arch/bloc.dart';
import 'package:demo/src/core/arch/bvvm_provider.dart';
import 'package:demo/src/core/arch/view_model.dart';
import 'package:demo/src/services/spacex/models/launch.dart';
import 'package:demo/src/ui/pages/spacex/list/bloc.dart';
import 'package:demo/src/ui/pages/spacex/list/view_model.dart';
import 'package:demo/src/ui/pages/spacex/list_item/bloc.dart';
import 'package:demo/src/ui/pages/spacex/list_item/item.dart';
import 'package:demo/src/ui/pages/spacex/list_item/view_model.dart';
import 'package:flutter/material.dart';

class SpaceXPage extends StatefulWidget {

  const SpaceXPage({ super.key });

  static BVVMProvider<SpaceXViewModel, SpaceXBloc> create({
    required SpaceXViewModel viewModel,
    required SpaceXBloc bloc,
  }) {
    return BVVMProvider.create(
      viewModel: viewModel,
      bloc: bloc,
      child: const SpaceXPage(),
    );
  }

  @override
  State<SpaceXPage> createState() => _SpaceXPageState();
}

class _SpaceXPageState extends State<SpaceXPage> {

  @override
  void didChangeDependencies() {
    Bloc.of<SpaceXBloc>( context, listen: false ).init();
    return super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    SpaceXViewModel vm = ViewModel.of<SpaceXViewModel>(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/spacex_bg.jpg'),
            fit: BoxFit.cover,
            filterQuality: FilterQuality.medium,
          )
        ),
        child: ValueListenableBuilder<List<SpaceXLaunch>>(
          valueListenable: vm.launches,
          builder: ( ctx, val, wgt ) => ListView.builder(
            itemCount: val.length,
            itemBuilder: ( ctx, idx ) {

              SpaceXListItemViewModel viewModel = SpaceXListItemViewModel( vm.launches.value[ idx ] );
              SpaceXListItemBloc bloc = SpaceXListItemBloc( viewModel );

              return SpaceXListItem.create(
                viewModel: viewModel,
                bloc: bloc,
              );
            },
          ),
        ),
      ),
    );
  }
}
