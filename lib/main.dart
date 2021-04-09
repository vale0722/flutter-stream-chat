import 'package:flutter_stream_chat_app/config.dart';
import 'package:flutter_stream_chat_app/page/home_page_mobile.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:uuid/uuid.dart';

import 'api/stream_api.dart';
import 'api/stream_channel_api.dart';
import 'api/stream_user_api.dart';

Future main() async {
//  await StreamUserApi.createUser(
// //      idUser: Uuid().v4(),
// //      username: Config.idValeria,
// //      image: 'https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/marilyn_monroe_artist_avatar-256.png',
// //
// //  );

    final idUser = 'db4a5441-2baf-447e-91c8-90ca168e9ecc';
    await StreamUserApi.login(idUser: idUser);

  //  await StreamChannelApi.createChannelWithUsers(
  //    name: 'Trabajo de comunicaciones',
  //    image: 'https://cdn.pixabay.com/photo/2020/03/17/17/46/database-4941338_1280.png',
  //    idMembers: [idUser],
  //  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamChat(
      streamChatThemeData: StreamChatThemeData(
      channelTheme: ChannelTheme(
        channelHeaderTheme: ChannelHeaderTheme(
          color: Colors.yellow,
        ),
      )),
      client: StreamApi.client,
      child: ChannelsBloc(
        child: MaterialApp(
          title: 'Mi Chat Personal',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.white,
            accentColor: Colors.yellow[500],
          ),
          home: HomePageMobile(),
        ),
      )
  );
}