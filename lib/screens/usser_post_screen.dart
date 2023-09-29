import 'package:flutter/material.dart';

class UserPostScreen extends StatelessWidget {
  const UserPostScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              15,
              (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          width: 1.5,
                          color: Colors.accents.last,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://picsum.photos/id/${1 + index}/380/600'),
                        // radius: 27,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'users ${1 + index}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const Divider(),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.pink),
              ),
              child: const CircleAvatar(
                backgroundImage:
                    NetworkImage('https://picsum.photos/id/250/380/600'),
              ),
            ),
            const Text(
              'saurabhkumar',
              style: TextStyle(color: Colors.white),
            )
          ],
        )
        // SizedBox(
        // height: MediaQuery.of(context).size.width,
        //   child: GridTile(
        //     header: const ListTile(
        //         leading: CircleAvatar(
        //           backgroundImage:
        //               NetworkImage('https://picsum.photos/id/250/380/600'),
        //           radius: 15,
        //         ),
        //         title: Text('saurabhkumar'),
        //         // subtitle: Text('saurabhkumar'),
        //         trailing: Icon(Icons.more_vert)),
        //     footer: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Row(
        //           children: [
        //             IconButton(
        //               onPressed: () {},
        //               icon: const Icon(Icons.favorite_outline),
        //             ),
        //             IconButton(
        //               onPressed: () {},
        //               icon: const Icon(Icons.message_outlined),
        //             ),
        //             IconButton(
        //               onPressed: () {},
        //               icon: const Icon(Icons.share),
        //             ),
        //             IconButton(
        //               // alignment: Alignment.bottomRight,
        //               onPressed: () {},
        //               icon: const Icon(Icons.save),
        //             ),
        //           ],
        //         ),
        //         const Text('5,54,435 likes')
        //       ],
        //     ),
        //     child: Padding(
        //       padding: const EdgeInsets.only(top: 50.0),
        //       child: SizedBox(
        //         height: 100,
        //         child: PageView(
        //           children: [
        //             Image.network('https://picsum.photos/id/500/380/600'),
        //             Image.network('https://picsum.photos/id/250/380/600'),
        //             Image.network('https://picsum.photos/id/400/380/600'),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        // )
      ],
    );
  }
}
