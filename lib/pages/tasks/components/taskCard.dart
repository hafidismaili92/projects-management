import 'package:flutter/material.dart';
import 'package:avatar_stack/avatar_stack.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(children: <Widget>[
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("23 juin 2023"), Icon(Icons.more_vert)]),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Web Designer")]),
        ),
        Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Progress",
              ),
            ),
            LinearProgressIndicator(
              backgroundColor: Colors.grey,
              color: Colors.redAccent,
              value: 0.6,
              semanticsLabel: 'Linear progress indicator',
            ),
            Container(alignment: Alignment.centerRight, child: Text("60%")),
          ],
        ),
        //Divider(color: Colors.blueGrey),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(children: [
            AvatarStack(
              height: 20,
              width: 60,
              avatars: [
                for (var n = 0; n < 4; n++)
                  NetworkImage('https://i.pravatar.cc/150?img=$n'),
              ],
            ),
          ]),
        ),
      ]),
    ));
  }
}
