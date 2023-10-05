import 'package:flutter/material.dart';
import 'package:instagram/api_services/user_servics.dart';
import 'package:instagram/models/api_user_model.dart';

class Userprovider extends ChangeNotifier {
  final service = UserService();

  List<ApiUser> apiUserList = [];

  //for pagination
  List<ApiUser> photos = [];

//for json place holder
  Future<void> getApiUser() async {
    final response = await service.getUserApi();

    if (response != null) {
      apiUserList = response;
    }
    notifyListeners();
  }

  // for Pagination
  Future<int> getPhotos({int limit = 10, int offset = 1}) async {
    final response = await service.getPhotosApi(limit, offset);
    // log(response.toString(), name: 'getPhotos');

    List<ApiUser> tempList = List<ApiUser>.from(
      response.map(
        (e) => ApiUser.fromjson(e),
      ),
    );
    offset == 1 ? photos = tempList : photos += tempList;
    notifyListeners();
    return tempList.length;
  }
}
