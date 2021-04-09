import 'package:flutter/material.dart';
import 'package:flutter_stream_chat_app/widget/chats_widget.dart';
import 'package:flutter_stream_chat_app/widget/activate_users_row_widget.dart';

class ChatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
    children: [
      const SizedBox(height:12),
      Container(
        height: 100,
        child: ActivateUsersRowWidget(),
      ),
      Expanded(child: ChatsWidget()),
    ],
  );
}