import 'package:json_annotation/json_annotation.dart';

part 'rocket.g.dart';

@JsonSerializable( anyMap: true )
class Rocket {

  @JsonKey( name: 'cost_per_launch' )
  int costPerLaunch;

  int boosters;
  String name, company;

  Rocket(
    this.boosters,
    this.costPerLaunch,
    this.name,
    this.company,
  );

  factory Rocket.fromJson(Map<String, dynamic> json) => _$RocketFromJson(json);

  Map<String, dynamic> toJson() => _$RocketToJson(this);


}