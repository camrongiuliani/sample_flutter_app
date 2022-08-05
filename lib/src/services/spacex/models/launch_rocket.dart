import 'package:demo/src/services/spacex/models/rocket.dart';
import 'package:json_annotation/json_annotation.dart';

part 'launch_rocket.g.dart';

@JsonSerializable( anyMap: true )
class LaunchRocket {

  @JsonKey( name: 'rocket_name' )
  String name;

  Rocket rocket;

  LaunchRocket( this.name, this.rocket );

  factory LaunchRocket.fromJson(Map<String, dynamic> json) => _$LaunchRocketFromJson(json);

  Map<String, dynamic> toJson() => _$LaunchRocketToJson(this);

}