import 'package:flutter/material.dart';
import 'package:instagram/screens/message_screen.dart';
import 'package:instagram/screens/usser_post_screen.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Instagram',
          style: TextStyle(
            fontSize: 35,
            fontFamily: 'Cookie',
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border_outlined,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.message_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          currentIndex = value;
          setState(() {});
          controller.jumpToPage(value);
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.red,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined), label: 'New Post'),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_call_sharp), label: 'New Post'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'New Post'),
        ],
      ),
      body: PageView(
        controller: controller,
        children: [
          const UserPostScreen(),
          const MessageScreen(),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class MyHomePage extends StatelessWidget {
//   final String title;
//   const MyHomePage({super.key, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             title: const Text(
//               'Instagram',
//               style: TextStyle(
//                 fontSize: 35,
//                 fontFamily: 'Cookie',
//               ),
//             ),
//             actions: [
//               IconButton(
//                 onPressed: () {},
//                 icon: const Icon(Icons.favorite_border_outlined),
//               ),
//               IconButton(
//                 onPressed: () {},
//                 icon: const Icon(Icons.facebook),
//               ),
//             ],
//           ),
//           SliverList(
//             delegate: SliverChildBuilderDelegate(
//               (BuildContext context, int index) {
//                 // Replace this with your content
//                 return PageView(
//                   children: [
//                     Container(
//                       color: Colors.redAccent,
//                     )
//                   ],
//                 );
//               },
//               childCount: 30, // Adjust the number of items as needed
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: BottomNavigationBar(
//               items: const [
//                 BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'cv'),
//                 BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'saf'),
//                 BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'sa'),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
