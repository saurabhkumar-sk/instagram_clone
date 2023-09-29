import 'package:flutter/material.dart';
import 'package:instagram/api_services/user_servics.dart';
import 'package:instagram/models/api_user_model.dart';

class Userprovider extends ChangeNotifier {
  final service = UserService();

  List<ApiUser> apiUserList = [];

  Future<void> getApiUser() async {
    final response = await service.getUserApi();

    if (response != null) {
      apiUserList = response;
    }
    notifyListeners();
  }
}
