import 'package:flutter/material.dart';
import 'package:whats_app/models/the_chats.dart';

class StoresPage extends StatelessWidget {
  const StoresPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theheight = MediaQuery.of(context).size.height;
    final thewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: thewidth * 0.85,
            top: theheight * 0.68,
            child: CircleAvatar(
              radius: 22,
              backgroundColor: const Color(0xffE9EDF0),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit),
                color: Colors.grey[700],
              ),
            ),
          ),
          Positioned(
            left: thewidth * 0.83,
            top: theheight * 0.75,
            child: const CircleAvatar(
              radius: 30,
              backgroundColor: Color.fromARGB(255, 15, 136, 124),
              child: Icon(Icons.camera_alt),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
// add story
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: ListTile(
                    leading: Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          ClipOval(child: Image.asset(chatsList[0].imageurl)),
                          const CircleAvatar(
                            radius: 11.5,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor:
                                  Color.fromARGB(255, 43, 182, 152),
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          )
                        ]),
                    title: const Text(
                      'My Status',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text(
                      'Tap to add status update',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    trailing: Icon(
                      Icons.more_vert,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
//stores un viewed
                const Padding(
                  padding: EdgeInsets.only(left: 17, top: 16),
                  child: Text(
                    'Recent updates',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600),
                  ),
                ),
// stores
                ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: chatsList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor:
                            const Color.fromARGB(255, 43, 182, 152),
                        child: CircleAvatar(
                            radius: 26,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 24,
                              backgroundImage:
                                  AssetImage(chatsList[index].imageurl),
                            )),
                      ),
                      title: Text(
                        chatsList[index].name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: chatsList[index].id > 3 == 0
                          ? const Text(
                              'Today, 1:47 pm',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            )
                          : const Text(
                              '23 minutes ago',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                    );
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 17, top: 16),
                  child: Text(
                    'Viewed updates',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600),
                  ),
                ),

                ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[400],
                    child: CircleAvatar(
                        radius: 26,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 24,
                          backgroundImage: AssetImage(chatsList[3].imageurl),
                        )),
                  ),
                  title: Text(
                    chatsList[3].name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text(
                    'Today, 1:47 pm',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 17, top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.lock,
                        color: Colors.grey[700],
                        size: 19,
                      ),
                      const Text(
                        'Your status updates are ',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600),
                      ),
                      const Text(
                        'end-to-end encrypted ',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.blue,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 200,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
