// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Works _$WorksFromJson(Map<String, dynamic> json) => Works(
      users: Users.fromJson(json['users'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WorksToJson(Works instance) => <String, dynamic>{
      'users': instance.users,
    };

Users _$UsersFromJson(Map<String, dynamic> json) => Users(
      id: json['id'] as int,
      fullName: json['fullName'] as String,
      username: json['username'] as String,
      phone: json['phone'] as String,
      img: json['img'] as String,
      depId: json['depId'] as int,
      status: json['status'] as int,
      salary: json['salary'] as int,
      managerName: json['managerName'] as String,
      isEmployee: json['isEmployee'] as int,
      isManager: json['isManager'] as bool,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      isDeleted: json['isDeleted'] as bool,
    );

Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'username': instance.username,
      'phone': instance.phone,
      'img': instance.img,
      'depId': instance.depId,
      'status': instance.status,
      'salary': instance.salary,
      'managerName': instance.managerName,
      'isEmployee': instance.isEmployee,
      'isManager': instance.isManager,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'isDeleted': instance.isDeleted,
    };
