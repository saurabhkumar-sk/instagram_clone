import 'dart:convert';
import 'dart:developer';

import 'package:instagram/api_services/base_service.dart';
import 'package:instagram/models/api_user_model.dart';
import 'package:instagram/models/random_model.dart';
import 'package:instagram/utils/api_urls.dart';

class UserService extends BaseService {
  //pagination (limit or offset)
  Future getPhotosApi(int limit, int offset) async {
    final api = '${ApiUrls.photoList}?page=$offset&limit=$limit';
    final response = await getHttp(api);

    log(response.body, name: 'getPhotosApi');

    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return [];
  }

  //Jsonplaceholder
  // Future<List<ApiUser>?> getUserApi() async {
  //   try {
  //     final response = await getHttp('');
  //     // log(response.body, name: 'getuserApi');

  //     final userMapList = json.decode(response.body);

  //     if (response.statusCode != 200) return null;
  //     List<ApiUser> userList =
  //         List<ApiUser>.from(userMapList.map((e) => ApiUser.fromjson(e)));
  //     log(userMapList.toString(), name: 'getUserApiResponse');

  //     return userList;
  //   } catch (e, s) {
  //     log(e.toString(), name: 'getUserApi error', stackTrace: s);
  //     return null;
  //   }
  // }

  //Reverpod
  Future<List<ApiUser>> getUserApi() async {
    try {
      final response = await getHttp(ApiUrls.user);
      log(response.body, name: 'getuserApi');

      final userMapList = json.decode(response.body);

      if (response.statusCode != 200) return [];
      List<ApiUser> userList =
          List<ApiUser>.from(userMapList.map((e) => ApiUser.fromJson(e)));
      log(userMapList.toString(), name: 'getUserApiResponse');

      return userList;
    } catch (e, s) {
      log(e.toString(), name: 'getUserApi error', stackTrace: s);
      return [];
    }
  }
//Random(reverpod)
  Future<RandomUser?> getRandomUserApis() async {
    try {
      final response = await getHttp('');

      // log(response.statusCode.toString(), name: 'Status');
      // log(response.body, name: 'getRandomUserApis');

      final userMap = json.decode(response.body);

      if (response.statusCode != 200) return null;
      RandomUser user = RandomUser.fromJson(userMap['results'][0]);

      log(userMap.toString(), name: 'getRandomUserApi response');

      return user;
    } catch (e, s) {
      log(e.toString(), name: 'error getRandomUserApis', stackTrace: s);
      return null;
    }
  }
}

// //random Api
// class RandomUserServices extends BaseService {
//   Future<RandomUser?> getRandomUserApis() async {
//     try {
//       final response = await getHttp('');

//       // log(response.statusCode.toString(), name: 'Status');
//       // log(response.body, name: 'getRandomUserApis');

//       final userMap = json.decode(response.body);

//       if (response.statusCode != 200) return null;
//       RandomUser user = RandomUser.fromJson(userMap['results'][0]);

//       log(userMap.toString(), name: 'getRandomUserApi response');

//       return user;
//     } catch (e, s) {
//       log(e.toString(), name: 'error getRandomUserApis', stackTrace: s);
//       return null;
//     }
//   }
// }
