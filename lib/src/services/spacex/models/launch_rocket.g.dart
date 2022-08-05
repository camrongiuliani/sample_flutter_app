// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch_rocket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LaunchRocket _$LaunchRocketFromJson(Map json) => LaunchRocket(
      json['rocket_name'] as String,
      Rocket.fromJson(Map<String, dynamic>.from(json['rocket'] as Map)),
    );

Map<String, dynamic> _$LaunchRocketToJson(LaunchRocket instance) =>
    <String, dynamic>{
      'rocket_name': instance.name,
      'rocket': instance.rocket,
    };
