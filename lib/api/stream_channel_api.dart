import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_stream_chat_app/api/stream_api.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:uuid/uuid.dart';

class StreamChannelApi {
  static Future<Channel> createChannelWithUsers(
      BuildContext context, {
        @required String name,
        @required String image,
        List<String> idMembers = const [],
        String idChannel,
  }) async {
    final id = idChannel ?? Uuid().v4();
    final idSelfUser = StreamChat.of(context).user.id;
    final channel = StreamApi.client.channel(
      'messaging',
      id: id,
      extraData: {
        'name': name,
        'image': image,
        'members': idMembers..add(idSelfUser),
      }
    );

    await channel.create();

    await channel.watch();

    return channel;
  }

  static createChannel(
  BuildContext context, {
    @required String name,
    List<String> idMembers = const []
  }) async {
    final idChannel = Uuid().v4();

    return createChannelWithUsers(
        context,
        name: name,
        image: 'https://cdn3.iconfinder.com/data/icons/business-avatar-1/512/12_avatar-256.png',
        idMembers: idMembers,
        idChannel: idChannel,
    );
  }
}