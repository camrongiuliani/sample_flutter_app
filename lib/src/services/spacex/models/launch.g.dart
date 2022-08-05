// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpaceXLaunch _$SpaceXLaunchFromJson(Map json) => SpaceXLaunch(
      json['mission_name'] as String,
      json['details'] as String?,
      (json['mission_id'] as List<dynamic>).map((e) => e as String).toList(),
      LaunchRocket.fromJson(Map<String, dynamic>.from(json['rocket'] as Map)),
    );

Map<String, dynamic> _$SpaceXLaunchToJson(SpaceXLaunch instance) =>
    <String, dynamic>{
      'mission_name': instance.name,
      'details': instance.details,
      'mission_id': instance.missionId,
      'rocket': instance.launchRocket,
    };
