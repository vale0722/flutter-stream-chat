import 'package:flutter/cupertino.dart';
import 'package:flutter_stream_chat_app/config.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class StreamApi {
  static final client = StreamChatClient(Config.apiKey, logLevel: Level.SEVERE);

  static Future initUser(
    StreamChatClient client, {
      @required String username,
      @required String urlImage,
      @required String id,
      @required String token,
    }) async {
    final user = User(
      id: id,
      extraData: {
        'name': username,
        'image': urlImage,
      }
    );

    await client.connectUser(user, token);
  }

  static Future<Channel> watchChannel(
      StreamChatClient client, {
        @required String type,
        @required String id,
  }) async {
      final channel = client.channel(type, id: id,);

      channel.watch();
      return channel;
  }
}