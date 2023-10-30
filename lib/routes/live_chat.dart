import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:whats_app/models/message_model.dart';
import 'package:whats_app/models/the_chats.dart';
import 'package:whats_app/widgets/message_receive.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LiveChatPage extends StatefulWidget {
  const LiveChatPage({super.key});

  @override
  State<LiveChatPage> createState() => _LiveChatPageState();
}

class _LiveChatPageState extends State<LiveChatPage> {
  String? message;
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');

  @override
  Widget build(BuildContext context) {
    final theheight = MediaQuery.of(context).size.height;
    final thewidth = MediaQuery.of(context).size.width;
    Map argments = ModalRoute.of(context)!.settings.arguments as Map;
    TextEditingController controll = TextEditingController();
    final scrollcontroller = ScrollController();
    String email = argments['email'];

    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('createdAt').snapshots(),
      builder: (context, snapshot) {
        List<Messages> messageslist = [];
        if (snapshot.hasData) {
          for (var i = 0; i < snapshot.data!.docs.length; i++) {
            messageslist.add(Messages.fromJson(snapshot.data!.docs[i]));
          }

          return Scaffold(
            //app bar------------------------
            appBar: AppBar(
              backgroundColor: const Color(0xff075E55),
              elevation: 0,
              leading: Padding(
                padding: EdgeInsets.only(
                  top: theheight * 0.01,
                  left: thewidth * 0.01,
                ),
                //back icon----------
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 23,
                    )),
              ),
              leadingWidth: thewidth * 0.06,
              title: ListTile(
                leading: CircleAvatar(
                  radius: 20,
                  backgroundImage:
                      AssetImage(chatsList[argments['indix']].imageurl),
                ),
                title: Text(
                  chatsList[argments['indix']].name,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'online',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.videocam_rounded)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
              ],
            ),
            body: Stack(children: [
              //the background image------------------------------------
              SizedBox(
                  height: theheight,
                  width: thewidth,
                  child: Image.asset(
                    'assets/images/whatsappwallpaper.jpg',
                    fit: BoxFit.cover,
                  )),
              SingleChildScrollView(
                controller: scrollcontroller,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 245, 228, 182),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: MediaQuery.of(context).size.width * 0.65,
                      margin: const EdgeInsets.only(bottom: 20, top: 10),
                      padding: const EdgeInsets.all(8),
                      child: const Text(
                        'Messages and calls are end-to-end encrypted, No one outside of this chat can read or listen. tap to learn more',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    // messages of user---------------------------------
                    MessageReceive(text: 'Hi, Programer how are you ?'),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        primary: false,
                        itemCount: messageslist.length,
                        itemBuilder: (context, index) {
                          if (email == messageslist[index].id) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  ClipPath(
                                    clipper: UpperNipMessageClipperTwo(
                                        MessageType.send),
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          top: theheight * 0.011,
                                          bottom: theheight * 0.011,
                                          left: thewidth * 0.04,
                                          right: thewidth * 0.04),
                                      decoration: const BoxDecoration(
                                        color: Color(0xffE3F8C8),
                                      ),
                                      child: Text(messageslist[index].message),
                                    ),
                                  )
                                ],
                              ),
                            );
                          } else {
                            return MessageReceive(
                                text: messageslist[index].message);
                          }
                        }),
                    SizedBox(height: theheight * 0.06)
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: theheight * 0.06,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            // smile emoge button---------------------------------------------
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.sentiment_satisfied_rounded,
                                color: Colors.black45,
                                size: thewidth * 0.06,
                              ),
                            ),

                            //text field----------------------------------------------
                            Expanded(
                              child: TextField(
                                onChanged: (value) {
                                  message = value;
                                },
                                controller: controll,
                                style: const TextStyle(color: Colors.black54),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Write a message',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400,
                                    fontSize: thewidth * 0.04,
                                  ),
                                ),
                              ),
                            ),
                            // the icons--------------------------------------------
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.attachment_outlined,
                                color: Colors.black45,
                                size: thewidth * 0.06,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.camera_alt,
                                color: Colors.black45,
                                size: thewidth * 0.06,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //the send icon-------------------------------------------
                    Padding(
                      padding: EdgeInsets.all(thewidth * 0.01),
                      child: CircleAvatar(
                          radius: 22,
                          backgroundColor: const Color(0xff075E55),
                          child: IconButton(
                            onPressed: () {
                              messages.add({
                                'message': message,
                                'createdAt': DateTime.now(),
                                'id': argments['email'],
                              });
                              controll.clear();
                              scrollcontroller.animateTo(
                                scrollcontroller.position.maxScrollExtent,
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeIn,
                              );
                            },
                            icon: const Icon(Icons.send),
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
              ),
            ]),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
