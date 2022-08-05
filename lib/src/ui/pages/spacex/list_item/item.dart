import 'package:demo/src/core/arch/bloc.dart';
import 'package:demo/src/core/arch/bvvm_provider.dart';
import 'package:demo/src/core/arch/view_model.dart';
import 'package:demo/src/core/widgets/vif.dart';
import 'package:demo/src/ui/pages/spacex/list_item/bloc.dart';
import 'package:demo/src/ui/pages/spacex/list_item/view_model.dart';
import 'package:demo/src/ui/pages/spacex/sheet/bloc.dart';
import 'package:demo/src/ui/pages/spacex/sheet/sheet.dart';
import 'package:demo/src/ui/pages/spacex/sheet/view_model.dart';
import 'package:flutter/material.dart';

class SpaceXListItem extends StatefulWidget {

  const SpaceXListItem({ super.key });

  static BVVMProvider<SpaceXListItemViewModel, SpaceXListItemBloc> create({
    required SpaceXListItemViewModel viewModel,
    required SpaceXListItemBloc bloc,
  }) {
    return BVVMProvider.create(
      viewModel: viewModel,
      bloc: bloc,
      child: const SpaceXListItem(),
    );
  }

  @override
  State<SpaceXListItem> createState() => _SpaceXListItemState();
}

class _SpaceXListItemState extends State<SpaceXListItem> with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();

    // Bloc.of<SpaceXBloc>( context, listen: false ).init();

  }

  @override
  void didChangeDependencies() {

    SpaceXListItemViewModel vm = ViewModel.of( context );

    vm.detailController?.dispose();

    vm.detailController = AnimationController(
      duration: vm.kExpand,
      vsync: this,
    );

    vm.detailHeightFactor = vm.detailController?.drive( vm.easeInTween );

    if ( vm.showingDetail.value ) {
      vm.detailController?.value = 1.0;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    SpaceXListItemViewModel vm = ViewModel.of(context, listen: false);

    return Vif(
      test: () => vm.detailController != null,
      ifTrue: () => AnimatedBuilder(
        animation: vm.detailController!.view,
        builder: ( c, w ) => Card(
          clipBehavior: Clip.hardEdge,
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular( 12.0 ),
            side: const BorderSide(
              color: Colors.grey,
              width: 0.4,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildRow(),
              buildDetail(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRow() {

    SpaceXListItemViewModel vm = ViewModel.of(context);

    return Container(
      color: vm.backgroundColor.value,
      constraints: const BoxConstraints(
        minHeight: 75.0,
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all( 8.0 ),
            padding: const EdgeInsets.all(2.0),
            height: 40.0,
            width: 40.0,

            child: Material(
              elevation: 4.0,
              borderRadius: BorderRadius.circular( 30.0 ),
              color: const Color( 0xffcccccc ),
              clipBehavior: Clip.hardEdge,

              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Transform.rotate(
                  angle: vm.dropdownIconAngle,
                  child: Icon(
                    vm.dropdownIcon,
                    color: vm.dropdownIconColor,
                  ),
                ),
                onPressed: () => Bloc.of<SpaceXListItemBloc>(context).toggleDetail(),
              ),
            ),
          ),
          ValueListenableBuilder<String>(
            valueListenable: vm.launchName,
            builder: ( ctx, val, _ ) => Text( val ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only( right: 8.0 ),
                child: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: ( ctx ) {
                        SpaceXLaunchInfoSheetViewModel viewModel = SpaceXLaunchInfoSheetViewModel( vm.launch.value );
                        SpaceXLaunchInfoSheetBloc bloc = SpaceXLaunchInfoSheetBloc( viewModel );
                        return SpaceXLaunchInfoSheet.create( viewModel: viewModel, bloc: bloc );
                      },
                    );
                  },
                  icon: const Icon( Icons.info_outline ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDetail() {
    SpaceXListItemViewModel vm = ViewModel.of(context);

    return ClipRect(
      child: Align(
        heightFactor: vm.detailHeightFactor!.value,
        child: Container(
          color: vm.detailBackgroundColor.value,
          child: ValueListenableBuilder<String?>(
            valueListenable: ViewModel.of<SpaceXListItemViewModel>(context).launchDetails,
            builder: ( ctx, val, _ ) => Container(
              width: double.infinity,
              padding: const EdgeInsets.all( 8.0 ),
              child: Text(
                val ?? 'No details to display!',
                textAlign: () {
                  if ( val == null ) {
                    return TextAlign.center;
                  }
                }(),
                style: const TextStyle(
                    color: Colors.white
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
