import 'package:flutter/material.dart';
import 'package:project_management/shared_components/roundedIconButton.dart';

import 'package:project_management/themes/inputDecorations.dart';

class ConversationView extends StatelessWidget {
  const ConversationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints.expand(),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                  children: List.generate(
                      50,
                      (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: index % 2 == 0
                                ? MessageWidget(
                                    isRecevied: true,
                                    content:
                                        "this is a recieved msg from the destination alon msg loreum lapson")
                                : MessageWidget(
                                    isRecevied: false,
                                    content: "this is a sended msg"),
                          ))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(children: [
                Expanded(
                    child: TextField(
                  style: Theme.of(context).textTheme.labelLarge,
                  decoration: AppInputDecorations.roundedFilledNoneBorder(
                      Colors.white70),
                )),
                SizedBox(width: 2),
                RoundedIconButton(onTap: () => print('hi'), icon: Icons.send)
              ]),
            )
          ],
        ));
  }
}

class MessageWidget extends StatelessWidget {
  bool isRecevied = false;
  String content = "";

  MessageWidget({this.isRecevied = false, this.content = ""});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment:
            isRecevied ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          Flexible(
            child: Material(
                borderRadius: isRecevied
                    ? BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))
                    : BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                elevation: 2,
                color: isRecevied
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.primary,
                surfaceTintColor: Colors.blueAccent,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(content,
                      style: TextStyle(
                          color: isRecevied
                              ? Theme.of(context).colorScheme.onSecondary
                              : Theme.of(context).colorScheme.onPrimary)),
                )),
          )
        ]);
  }
}
