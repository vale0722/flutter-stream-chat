import 'package:flutter/material.dart';
import 'package:flutter_stream_chat_app/api/stream_api.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:flutter_stream_chat_app/model/user.dart' as model;

class StreamUserApi {
  static Future<List<model.User>> getAllUsers({bool includeMe=false}) async {
    final sort = SortOption('last_message_at');
    final response = await StreamApi.client.queryUsers(sort: [sort]);

    return response.users
        .map((user) => model.User(
      idUser: user.id,
      name: user.name,
      imageUrl: user.extraData['image'],
      isOnline: user.online,
    )).toList();;
  }

  static Future createUser({
    @required String idUser,
    @required String username,
    @required String image,
  }) async {
    final token = StreamApi.client.devToken(idUser);
    final user = User(
        id: idUser,
      extraData: {
          'name': username,
          'image': image,
      },
    );
    
    await StreamApi.client.connectUser(user, token);
  }

  static Future login({
    @required String idUser
  }) async {
    final token = StreamApi.client.devToken(idUser);
    final user = User(id: idUser);

    await StreamApi.client.connectUser(user, token);
  }
}