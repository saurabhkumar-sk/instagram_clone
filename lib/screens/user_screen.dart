import 'package:flutter/material.dart';
import 'package:instagram/models/api_user_model.dart';
import 'package:instagram/povider/user_provider.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late Userprovider provider;
  bool loader = true;
  ApiUser? user;

  // List<Map<String, dynamic>> myList = [];

  // int myLimit = 20;
  // int myOffset = 0;
  // bool pageinate = true;

  // Future<void> getList({int offset = 0, int limit = 20}) async {
  //   if (!pageinate) {
  //     return;
  //   }
  //   setState(() {
  //     loader = true;
  //   });
  //   await getData(offset: myOffset, limit: myLimit).then((value) {
  //     myList += value;
  //     myOffset = myOffset + 20;
  //     myLimit = myLimit + 20;

  //     if (value.length < 20) pageinate = false;

  //     loader = false;
  //     setState(() {});
  //   });
  // }

  // Future<List<Map<String, dynamic>>> getData({
  //   int limit = 20,
  //   int offset = 0,
  // }) async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   // final list = user.getRange(offset, limit).toList();
  //   await Future.delayed(const Duration(seconds: 2));
  //   return await Future.delayed(const Duration(seconds: 2));
  // }

  @override
  void initState() {
    // getList();

    super.initState();
    provider = Provider.of(context, listen: false);
    provider.getApiUser().then((value) {
      setState(() {
        loader = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User Screen',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Selector<Userprovider, List<ApiUser>>(
        selector: (p0, p1) => p1.apiUserList,
        builder: (context, value, child) => loader == true
            ? const Center(child: CircularProgressIndicator())
            // : NotificationListener(
            //     onNotification: (notification) =>
            //         Utils.scrollNotifier(notification, () {
            //       getList(offset: myOffset);
            //     }),
            //     child:
            : ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                  child: GridTile(
                    // child: Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Text(value[index].id),
                    //     Text(value[index].author),
                    //   ],
                    // ),
                    child: Image.network(
                      value[index].downloadUrl,
                    ),
                  ),
                ),
              ),
      ),
      // ),
    );
  }
}


// List<Map<String, dynamic>> myList = [];
//   bool loader = false;

//   int myLimit = 20;
//   int myOffset = 0;
//   bool pageinate = true;

//   Future<void> getList({int offset = 0, int limit = 20}) async {
//     if (!pageinate) {
//       return;
//     }
//     setState(() {
//       loader = true;
//     });
//     await getData(offset: myOffset, limit: myLimit).then((value) {
//       myList += value;
//       myOffset = myOffset + 20;
//       myLimit = myLimit + 20;

//       if (value.length < 20) pageinate = false;

//       loader = false;
//       setState(() {});
//     });
//   }

//   Future<List<Map<String, dynamic>>> getData({
//     int limit = 20,
//     int offset = 0,
//   }) async {
//     await Future.delayed(const Duration(seconds: 2));
//     final list = myImages.getRange(offset, limit).toList();
//     await Future.delayed(const Duration(seconds: 2));
//     return list;
//   }