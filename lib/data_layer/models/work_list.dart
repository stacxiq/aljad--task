import 'package:json_annotation/json_annotation.dart';
part 'work_list.g.dart';

@JsonSerializable()
class Works {
  final Users users;

  Works({required this.users});

  factory Works.fromJson(Map<String, dynamic> json) => _$WorksFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$WorksToJson(this);
}

@JsonSerializable()
class Users {
  final int id;
  final String fullName;
  final String username;
  final String phone;
  final String img;
  final int depId;
  final int status;
  final int salary;
  final String managerName;
  final int isEmployee;
  final bool isManager;
  final String createdAt;
  final String updatedAt;
  final bool isDeleted;

  Users({
    required this.id,
    required this.fullName,
    required this.username,
    required this.phone,
    required this.img,
    required this.depId,
    required this.status,
    required this.salary,
    required this.managerName,
    required this.isEmployee,
    required this.isManager,
    required this.createdAt,
    required this.updatedAt,
    required this.isDeleted,
  });
  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UsersToJson(this);
}
