import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram/api_services/user_servics.dart';
import 'package:instagram/models/api_user_model.dart';
import 'package:instagram/models/random_model.dart';

//Reverpod (Future)
final userFutureProvider = FutureProvider<List<ApiUser>>(
  (ref) => UserService().getUserApi(),
);

//Reverpod(using class)
final userprovider = ChangeNotifierProvider((ref) => Userprovider());

class Userprovider extends ChangeNotifier {
  final service = UserService();

  List<ApiUser> apiUserList = [];

  //for pagination
  List<ApiUser> photos = [];

  RandomUser? randomUser;

//for json place holder
  Future<void> getApiUser() async {
    final response = await service.getUserApi();

    apiUserList = response;

    notifyListeners();
  }

// reverpod (random api)
  Future<RandomUser?> getRandomUserApis() async {
    final response = await service.getRandomUserApis();
    randomUser = response;
    log(response.toString(), name: 'randomuser');
    notifyListeners();
    return response;
  }

//   // for Pagination
//   Future<int> getPhotos({int limit = 10, int offset = 1}) async {
//     final response = await service.getPhotosApi(limit, offset);
//     // log(response.toString(), name: 'getPhotos');

//     List<ApiUser> tempList = List<ApiUser>.from(
//       response.map(
//         (e) => ApiUser.fromjson(e),
//       ),
//     );
//     offset == 1 ? photos = tempList : photos += tempList;
//     notifyListeners();
//     return tempList.length;
//   }
// }
}
