import 'package:flutter/material.dart';
import 'package:flutter_stream_chat_app/page/chats_page.dart';
import 'package:flutter_stream_chat_app/widget/user_image_widget.dart';

class HomePageMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Salas de chat'),
        centerTitle: true,
        leading: UserImageWidget(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.edit),
          ),
        ],
      ),
    body: ChatsPage(),
   );
}