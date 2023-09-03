import 'package:flutter/material.dart';
import 'package:project_management/pages/team/views/contactsList.dart';
import 'package:project_management/pages/team/views/conversation.dart';

class LargeChatScreen extends StatelessWidget {
  const LargeChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(children: [
      Container(width: 380, child: ContactsList()),
      Expanded(
        child: Container(
            color: Theme.of(context).colorScheme.surfaceVariant,
            child: ConversationView()),
      ),
    ]));
  }
}
