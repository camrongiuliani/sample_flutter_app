import 'package:demo/src/services/spacex/models/launch_rocket.dart';
import 'package:json_annotation/json_annotation.dart';

part 'launch.g.dart';

@JsonSerializable( anyMap: true )
class SpaceXLaunch {

  @JsonKey( name: 'mission_name' )
  String name;

  String? details;

  @JsonKey( name: 'mission_id' )
  List<String> missionId;

  @JsonKey( name: 'rocket' )
  LaunchRocket launchRocket;

  SpaceXLaunch( this.name, this.details, this.missionId, this.launchRocket );

  factory SpaceXLaunch.fromJson(Map<String, dynamic> json) => _$SpaceXLaunchFromJson(json);

  Map<String, dynamic> toJson() => _$SpaceXLaunchToJson(this);

}