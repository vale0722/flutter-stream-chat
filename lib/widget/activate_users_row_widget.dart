import 'package:flutter/material.dart';
import 'package:flutter_stream_chat_app/page/participants_page.dart';

class ActivateUsersRowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      buildCreateRoom(context);

  buildCreateRoom(BuildContext context) => GestureDetector(
    onTap: () {
      Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => ParticipantsPage(),
          )
      );
    },
    child: Container(
        width: 75,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey.shade100,
              child: Icon(Icons.video_call, size: 28, color: Colors.black,),
            ),
            Text(
              'Crear sala',
              style: TextStyle(fontSize: 14),
            )
          ],
        ),
      ),
  );
}