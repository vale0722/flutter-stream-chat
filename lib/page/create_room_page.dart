import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_stream_chat_app/api/stream_channel_api.dart';
import 'package:flutter_stream_chat_app/model/user.dart' as model;
import 'package:flutter_stream_chat_app/page/home_page_mobile.dart';
import 'package:flutter_stream_chat_app/widget/profile_image_widget.dart';
import 'package:image_picker/image_picker.dart';

class CreateRoomPage extends StatefulWidget {
  final List<model.User> participants;

  const CreateRoomPage({Key key, this.participants}) : super(key: key);

  @override
  _CreateRoomPageState createState() => _CreateRoomPageState();
}

class _CreateRoomPageState extends State<CreateRoomPage> {
  String name = '';

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Create Room'),
      actions: [
        IconButton(
          icon: Icon(Icons.done),
          onPressed: () async {
            final idParticipants = widget.participants
                .map((participant) => participant.idUser)
                .toList();

            await StreamChannelApi.createChannel(
              context,
              name: name,
              idMembers: idParticipants,
            );

            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => HomePageMobile()),
              ModalRoute.withName('/'),
            );
          },
        ),
        const SizedBox(width: 8),
      ],
    ),
    body: ListView(
      padding: EdgeInsets.all(24),
      children: [
        GestureDetector(
          child: buildImage(context),
        ),
        const SizedBox(height: 48),
        buildTextField(),
        const SizedBox(height: 12),
        Text(
          'Participantes',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(height: 12),
        buildMembers(),
      ],
    ),
  );


  Widget buildMembers() => Column(
      children: widget.participants
          .map((member) => ListTile(
            contentPadding: EdgeInsets.zero,
            leading: ProfileImageWidget(urlImage: member.imageUrl),
            title: Text(
              member.name,
              style: TextStyle(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
      )
      ).toList(),
  );

  Widget buildTextField() => TextFormField(
    decoration: InputDecoration(
      labelText: 'Nombre de la sala',
      labelStyle: TextStyle(color: Colors.black),
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(),
    ),
    maxLength: 30,
    onChanged: (value) => setState(() => {
      name = value,
      print(name)
    }),
  );

  Widget buildImage(BuildContext context) {
      return CircleAvatar(
        radius: 64,
        backgroundColor: Theme.of(context).accentColor,
        child: ProfileImageWidget(urlImage: null, radius: 64),
      );
    }
}
