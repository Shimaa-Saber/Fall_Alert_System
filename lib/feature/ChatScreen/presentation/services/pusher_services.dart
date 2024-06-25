import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

class PusherService {
  late PusherChannelsFlutter pusher;
  PusherChannel? channel;

  PusherService() {
    pusher = PusherChannelsFlutter.getInstance();

    pusher.init(
      apiKey: '238db1cb77cebc09b53a',
      cluster: 'eu',
      onConnectionStateChange: (String currentState, String previousState) {
        print("Pusher connection state: $currentState");
      },
      onError: (String message, int? code, dynamic exception) {
        print("Pusher error: $message code: $code exception: $exception");
      },
    );

    pusher.connect();
  }

  Future<void> subscribeToChannel(
      String channelName, Function(dynamic) onEvent) async {
    channel = await pusher.subscribe(
      channelName: channelName,
      onEvent: (event) {
        if (event.eventName == 'message-sent') {
          // onEvent(event.data);
          print(event.data);
        }
      },
    );
    pusher.onEvent!((PusherEvent event) {
      if (event.eventName == 'message-sent' &&
          event.channelName == channelName) {
        onEvent(event.data);
      }
    } as PusherEvent);
  }

  void disconnect() {
    pusher.disconnect();
  }
}
