import 'dart:convert';
import 'dart:developer';

import 'package:instagram/api_services/base_service.dart';
import 'package:instagram/models/api_user_model.dart';
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
