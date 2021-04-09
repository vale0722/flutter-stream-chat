import 'package:flutter/material.dart';
import 'package:flutter_stream_chat_app/api/stream_user_api.dart';
import 'package:flutter_stream_chat_app/widget/profile_image_widget.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:flutter_stream_chat_app/model/user.dart' as model;
import 'package:flutter_stream_chat_app/page/create_room_page.dart';

class ParticipantsPage extends StatefulWidget {
  @override
  _ParticipantsPageState createState() => _ParticipantsPageState();
}

class _ParticipantsPageState extends State<ParticipantsPage> {
  Future<List<model.User>> allUsers;
  List<model.User> selectedUsers = [];

  @override
  void initState() {
    super.initState();

    allUsers = StreamUserApi.getAllUsers();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Añadir participantes'),
      actions: [
        TextButton(
            onPressed: selectedUsers.isEmpty ? null : () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      CreateRoomPage(participants: selectedUsers),
              ));
            },
            child: Text('Crear')
        )
      ],
    ),
    body: FutureBuilder<List<model.User>> (
      future: allUsers,
      builder: (context, snapshot) {
        switch(snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          default:
            if(snapshot.hasError) {
              return Center(child: Text('Ha ocurrido un error al cargar los datos'));
            } else {
              final users = snapshot.data
                  .where((model.User user) =>
                      user.idUser != StreamChat.of(context).user.id
                  ).toList();

              return buildUsers(users);
            }
        }
      }
    ),
  );

  Widget buildUsers(List<model.User> users) => ListView.builder(
    itemCount: users.length,
    itemBuilder: (context, index) {
      final user = users[index];

      return CheckboxListTile(
        value: selectedUsers.contains(user),
        onChanged: (isAdded) => setState(() =>
        isAdded
            ? selectedUsers.add(user)
            : selectedUsers.remove(user)
        ),
        title: Container(
            child:Row(
              children: [
                ProfileImageWidget(urlImage: user.imageUrl),
                const SizedBox(width: 16),
                Expanded(
                    child: Text(
                      user.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                ),
              ],
            ),
        ),
      );
    },
  );
}