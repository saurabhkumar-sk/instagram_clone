import 'dart:convert';
import 'dart:developer';

import 'package:instagram/api_services/base_service.dart';
import 'package:instagram/models/api_user_model.dart';

class UserService extends BaseService {
  Future<List<ApiUser>?> getUserApi() async {
    try {
      final response = await getHttp('');
      // log(response.body, name: 'getuserApi');

      final userMapList = json.decode(response.body);

      if (response.statusCode != 200) return null;
      List<ApiUser> userList =
          List<ApiUser>.from(userMapList.map((e) => ApiUser.fromjson(e)));
      log(userMapList.toString(), name: 'getUserApiResponse');

      return userList;
    } catch (e, s) {
      log(e.toString(), name: 'getUserApi error', stackTrace: s);
      return null;
    }
  }
}
