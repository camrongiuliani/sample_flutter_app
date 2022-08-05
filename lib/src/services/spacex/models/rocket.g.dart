// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rocket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rocket _$RocketFromJson(Map json) => Rocket(
      json['boosters'] as int,
      json['cost_per_launch'] as int,
      json['name'] as String,
      json['company'] as String,
    );

Map<String, dynamic> _$RocketToJson(Rocket instance) => <String, dynamic>{
      'cost_per_launch': instance.costPerLaunch,
      'boosters': instance.boosters,
      'name': instance.name,
      'company': instance.company,
    };
