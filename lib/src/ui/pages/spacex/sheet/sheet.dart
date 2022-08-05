import 'dart:math';
import 'package:demo/src/core/arch/bvvm_provider.dart';
import 'package:demo/src/core/arch/view_model.dart';
import 'package:demo/src/core/widgets/multi_value_listenable_builder.dart';
import 'package:demo/src/core/widgets/vif.dart';
import 'package:demo/src/ui/pages/spacex/sheet/bloc.dart';
import 'package:demo/src/ui/pages/spacex/sheet/view_model.dart';
import 'package:flutter/material.dart';

class SpaceXLaunchInfoSheet extends StatefulWidget {

  const SpaceXLaunchInfoSheet({ super.key });

  static BVVMProvider<SpaceXLaunchInfoSheetViewModel, SpaceXLaunchInfoSheetBloc> create({
    required SpaceXLaunchInfoSheetViewModel viewModel,
    required SpaceXLaunchInfoSheetBloc bloc,
  }) {
    return BVVMProvider.create(
      viewModel: viewModel,
      bloc: bloc,
      child: const SpaceXLaunchInfoSheet(),
    );
  }

  @override
  State<SpaceXLaunchInfoSheet> createState() => _SpaceXLaunchInfoSheetState();
}

class _SpaceXLaunchInfoSheetState extends State<SpaceXLaunchInfoSheet> {

  @override
  void didChangeDependencies() {

    // ViewModel.of( context );

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    SpaceXLaunchInfoSheetViewModel vm = ViewModel.of(context, listen: false);

    return Wrap(
      children: [
        Container(
          padding: const EdgeInsets.all( 8.0 ),
          clipBehavior: Clip.hardEdge,
          width: double.infinity,
          decoration: BoxDecoration(
            color: vm.backgroundColor.value,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular( 16.0 ),
              topRight: Radius.circular( 16.0 ),
            ),
          ),
          child: MultiValueListenableBuilder(
            valueListenables: [
              vm.launchName,
              vm.missionIds,
              vm.company,
              vm.rocketName,
              vm.companyLabel,
              vm.missionIdLabel,
            ],
            builder: ( ctx, val, _ ) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    vm.launchName.value,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),

                  const SizedBox( height: 12.0, ),

                  IntrinsicWidth(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Vif(
                          test: () => vm.missionIds.value.isNotEmpty,
                          ifTrue: () => Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                vm.missionIdLabel.value,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox( width: 4.0, ),

                              Text(
                                vm.missionIds.value,
                                style: const TextStyle(),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              vm.rocketNameLabel.value,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              vm.rocketName.value,
                              style: const TextStyle(),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              vm.companyLabel.value,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox( width: 4.0, ),

                            Text(
                              vm.company.value,
                              style: const TextStyle(),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.all( 12.0 ),
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
                          angle: 180 * pi / 180,
                          child: const Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                  ),
                ],
              );
            }
          ),
        ),
      ],
    );
  }
}