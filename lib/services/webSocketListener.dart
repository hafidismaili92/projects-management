// import 'package:web_socket_channel/io.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';
//
// class WebSocketListener {
//   final String url;
//   late WebSocketChannel _channel;
//
//   WebSocketListener(this.url) {
//     _channel = IOWebSocketChannel.connect(url);
//   }
//
//   void listenToEvent(String event, Function(dynamic) onData) {
//     _channel.stream.listen((data) {
//       // Handle incoming event data here
//       if (data["event"] == event) {
//         onData(data["data"]);
//       }
//     });
//   }
//
//   void close() {
//     _channel.sink.close();
//   }
// }
