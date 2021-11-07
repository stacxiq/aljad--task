import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:test1/data_layer/models/user.dart';
import 'package:test1/data_layer/models/work_list.dart';
import 'package:test1/data_layer/services/dio_exceptions.dart';
import 'package:test1/data_layer/services/network.dart';

import 'package:test1/presentation/widgets/dialog.dart';
import 'package:test1/utils/constants.dart';

class UserProvider extends ChangeNotifier {
  bool isLoading = false;
  var box = Hive.box('token');
  late User _user;
  User get user => _user;

  late Works _works;
  Works get works => _works;
  String get token => box.get('access_token');

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getUser(
      {required String username,
      required String password,
      required BuildContext ctx}) async {
    setLoading(true);
    try {
      final response = await httpService
          .login('login', {'username': username, 'password': password});
      if (response != null) {
        _user = User.fromJson(response.data);
        box.put('access_token', user.access_token);
        Navigator.of(ctx).pushReplacementNamed(paginationRoute);
      } else {
        showCustomDialog(ctx, 'Error', 'Incorrect Credintals');
      }

      setLoading(false);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showCustomDialog(ctx, 'Error', errorMessage);
      setLoading(false);
    }
  }

  Future<void> getList() async {
    try {
      final response = await httpService.getList(
          'daily_work/getListMyWork?page=1&per_page=15', token);

      if (response != null) {
        _works = response.data['items'].first['works'];
      } else {}

      setLoading(false);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      print(errorMessage);
    }
  }
}
