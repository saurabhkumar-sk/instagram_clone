import 'package:flutter/material.dart';
import 'package:instagram/models/api_user_model.dart';
import 'package:instagram/povider/user_provider.dart';
import 'package:instagram/utils/utils.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late Userprovider provider;
  bool loader = true;
  bool isLoading = true;

  int offset = 1;
  bool paginate = true;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<Userprovider>(context, listen: false);
    pagination();
  }

  void pagination() {
    if (!paginate) return;
    setState(() {
      loader = true;
    });
    provider.getPhotos(offset: offset).then(
      (value) {
        isLoading = false;

        if (value < 10) paginate = false;
        loader = false;
        offset++;

        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Photos',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: isLoading
          ? const Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(child: CircularProgressIndicator()),
            )
          : Column(
              children: [
                Expanded(
                  child: Selector<Userprovider, List<ApiUser>>(
                    selector: (p0, p1) => p1.photos,
                    builder: (context, list, child) => NotificationListener(
                      onNotification: (notification) =>
                          Utils.scrollNotifier(notification, pagination),
                      child: GridView.builder(
                        padding: const EdgeInsets.all(10),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                        ),
                        itemCount: list.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(list[index].downloadUrl),
                            ),
                            title: Text(list[index].author),
                            subtitle: Text(list[index].id),
                          );
                          // GridTile(
                          //   footer: Text(list[index].author),
                          //   child: Image.network(
                          //     list[index].downloadUrl,
                          //   ),
                          // );
                        },
                      ),
                    ),
                  ),
                ),
                if (loader)
                  const Center(
                    child: CircularProgressIndicator(),
                  )
              ],
            ),
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